require File.join( File.expand_path(File.dirname(__FILE__)), '..',"helper")
require 'yaml'

require "#{LIB_DIR}/named_args"
require "#{LIB_DIR}/audio/ugens/ugen_operations" 
require "#{LIB_DIR}/audio/ugens/ugen" 
require "#{LIB_DIR}/audio/ugens/ugens" 
require "#{LIB_DIR}/extensions"


module UgenTest
end

class Klass
end

include Scruby
include Audio
include Ugens


describe Ugens do
  
  before do
    @udefs = YAML::load( File.open( "#{LIB_DIR}/audio/ugens/ugen_defs.yaml" ) )
  end

  it do
    @udefs.each_pair { |key, val| eval(key).should_not be_nil  }
  end
  
  it do
    @udefs.each_pair { |key, val| begin; eval(key).superclass.should eql( Scruby::Audio::Ugens::Ugen ); rescue; end  }
  end
  
  it do
    Vibrato.should respond_to(:ar)
    Vibrato.should respond_to(:kr)
  end
  
  it do
    Gendy1.should respond_to(:named_args_for)
  end
  
  it do
    Gendy1.should_receive(:new).with( :audio, 1.0, 1.0, 1.0, 1.0, 440.0, 660.0, 0.5, 0.5, 12.0, nil ).and_return( mock('ugen', :muladd => nil) )
    Gendy1.ar
  end
  
end


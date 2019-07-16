# frozen_string_literal: true

# Musical math
module Scruby::CoreExt
  module Fixnum
    def freq
      440 * (2**((self - 69) * 0.083333333333))
    end

    # method next tone
    # 1:1.05946
  end
end

if Gem::Version.new(RUBY_VERSION) < Gem::Version.new('2.4')
  class Fixnum
    prepend Scruby::CoreExt::Fixnum
  end
else
  class Integer
    prepend Scruby::CoreExt::Fixnum
  end
end

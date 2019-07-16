# frozen_string_literal: true

class Scruby::Server
  attr_reader :output
  def puts(string)
    @output ||= ''
    @output << string
    string
  end

  def flush
    @output = ''
  end
end

require_relative 'order.rb'
require_relative 'inputoutput.rb'

class InputOutput
  attr_reader :reader

  def initialize
    @reader
  end

  def print_to_terminal(output)
       print output
  end

  def get_input
    reader = gets.chomp
  end

end

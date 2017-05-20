require_relative 'order.rb'
require_relative 'inputoutput.rb'
class Menu

attr_reader :list
  def initialize
    @list = {pizza: 5, carbonara: 6}
  end

  def create_menu_string
    output = ""
    @list.each {|k,v|  output += "#{k} - £#{v}, " }
    output
  end

end

class Menu

attr_reader :list
  def initialize
    @list = {pizza: 5, carbonara: 6}
  end

  def print_menu
    output = ""
    @list.each {|k,v|  output += "#{k} - £#{v}, " }
    output
  end

end

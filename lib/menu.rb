require 'price'
class Menu
  attr_accessor :data
  def initialize(menu_data)
   @data = menu_data
  end

  def print
    string = ""
    @data.each do |data|
      string << "#{data[:id]}: #{data[:name]}" +
                " £#{Price::format(data[:price])}\n" +
                "   #{data[:description]}\n"
    end
    puts string
  end
end

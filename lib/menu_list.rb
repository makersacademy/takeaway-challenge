# list of all dishes with prices
class Menu_list

  attr_reader :menu_items

  def initialize
    @menu_items = []
    load_menu
  end

  private

  def load_menu
    file = File.open("menu.csv", "r")
    file.readlines.each_with_index do |line, index|
      type, name, price = line.chomp.split(',')
      @menu_items << {item: index+1, type: type.to_sym, name: name, price: price}
    end
  end

end

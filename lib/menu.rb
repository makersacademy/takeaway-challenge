#responsible for understanding the construction of a menu
class Menu
  def initialize
    @menu = {"spring roll"=>0.99, "char sui bun"=>3.99, "pork dumpling"=>2.99, "peking duck"=>7.99, "fu-king fried rice"=>5.99}
  end

  def show_menu
    puts "Here is the menu:"
    puts menu
  end

  def check_price(item)
    raise 'Item not on menu' unless match_item(item)
     match_item(item)
  end

  def calculate_subtotal(basket)
    output = []
    basket.each do |item, quantity|
      output << [item, quantity, match_item(item) * quantity ]
    end
    output
  end

  private

  attr_reader :menu

  def match_item(item)
    menu[item.downcase]
  end
end

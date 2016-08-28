#understands how to hold chosen items

class Basket

  attr_reader :current_basket

  def initialize
    current_basket = {}
  end

  def add_to_cart
    puts "input the number you want and hit enter. To finish, hit enter twice."
    until item == "" do
      @current_num = gets.chomp
      item_check(@current_item)
    end
  end

  def interpreting_num
    @menu = Italian.menu
    keys = menu.key
    @menu[keys[@current_num]]
  end

  def item_check
    if current_basket.has_key?(item)
      current_basket[item] += 1
    else
      current_basket[item] = 1
    end
  end

end

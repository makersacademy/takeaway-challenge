require_relative "menu"
class Order

  attr_reader :selection, :menu, :shopping_cart, :price, :prices, :total

  def initialize(menu = Menu.new)
    @selection = {}
    @shopping_cart = []
    @menu = menu
    @prices = []
  end

  def select_items(item, quantity)
    @selection = { item.to_sym => quantity }
    add_selection_to_order
    return "#{quantity} x #{item}(s) added to your shopping cart"
  end

  def add_selection_to_order
    @shopping_cart << @selection
  end

  def work_out_price
    @shopping_cart.each do |food_item|
      food_item.each do |item, quantity|
        @price = menu.menu_items[item]
        puts "#{quantity} x #{item} at £#{@price} = £#{@price *= quantity}"
        @prices << @price
      end
    end
  end

  def calculate_total_price
    @total = @prices.sum
  end

  def price_calculation
    puts work_out_price
    calculate_total_price
    puts display_total_price
  end

  def display_total_price
    return "Your total is £#{@total}"
  end

end

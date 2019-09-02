require_relative "menu"

class Order
  attr_reader :shopping_cart, :menu, :shopping_cart, :total_price, :choice

  def initialize(menu = Menu.new)
    @shopping_cart = []
    @menu = menu
    @total_price = []
    @selection = {}
    @prices = []
    @finalprice =[]
    @price = []
  end

  def select_food(item, quantity)
    @selection = {item.to_sym => quantity}
    add_choice_to_cart
    "#{quantity} #{item} added to the shopping cart"

  end

  def add_choice_to_cart
    @shopping_cart << @selection
  end

  def read_menu
   puts @menu.read_menu
 end

  def get_price
      @shopping_cart.each do |food_item|
      food_item.each do |item, quantity|
      @price = menu.menu_items[item]
      @prices << @price
      puts "The total price of the #{item} is #{@price} x #{quantity} = #{@price*quantity}"
      puts @totalprice = "#{@price*quantity}"
      @finalprice << @totalprice.to_i

      end
    end
  end

  def final_item_price
    @finalprice
  end

  def calculate_total
    @total = @finalprice.reduce {|x, sum| x + sum}
    puts "The total price for the meal is £#{@total}.00"
    p @total
  end

end

# take each item from shopping_cart and return its price x quantity

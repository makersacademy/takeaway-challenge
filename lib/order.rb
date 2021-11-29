require_relative 'menu'
require_relative 'message'

class Order

  attr_reader :order_menu, :new_order, :basket, :quantity, :total

  def initialize 
    @menu = Menu.new 
    @menu.generate_example_menu
    @message = Message.new 
    @basket = {}
    @total = 0
    @empty_array = []
  end

  def print_menu
    @menu.show_menu
  end

  def choose_dish(dish,quantity)
    @dish = dish
    @quantity = quantity
    @order_menu = (@empty_array << print_menu).reduce Hash.new, :merge
    adding_to_basket
    @order_menu = []

  end

  def view_basket
    @basket = basket
  end

  def calculate_total
    fail 'you have not ordered anything' if @basket.empty?
    find_total
    @total 
  end

  def confirm_order
    @message.confirmation_message(@total)
  end

private

  def find_total
    sum = 0
    @basket.each_value do |price, quantity|
      total_per_dish = price * quantity
      sum += total_per_dish
    end  
    @total = sum.to_f
  end

  def adding_to_basket
    @order_menu.each do |food, price|
      if @dish.to_sym == food
        @basket[food] = [price, @quantity]
      end
    end    
  end

end

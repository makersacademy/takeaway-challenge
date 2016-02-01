
require_relative 'italian_menu'
require_relative 'order'
require_relative 'checkout_message'
require 'twilio-ruby'
require 'dotenv'


class TakeAway

SCREEN_WIDTH = 40

attr_reader :cuisine_choice, :order, :basket, :selection, :menu_choice, :price, :order


  def initialize(cuisine_choice=ItalianMenu, order=Order, basket=Basket)
    @cuisine_choice = cuisine_choice
    @basket = basket
    @order = order
    @selection = Array.new
  end

  def menu_choice(meal= :dinner, course= :all)
    @meal = meal
    @course = course
    fail "We only serve lunch and dinner" unless meal_choice_valid?
    fail "Please choose starter, main, dessert or 'all'" unless course_choice_valid?
    @menu_choice = cuisine_choice.new(meal, course).dishes
  end


  def display
    menu_choice.each{|key, value| puts("#{key}".ljust(SCREEN_WIDTH) + "#{value}".rjust(SCREEN_WIDTH))}
  end


  def take_order
    p "What would you like to eat? Eg '2 Carbonara and a Tiramisu'"
    user_input = STDIN.gets.chomp
    @order = order.new(user_input, menu_choice)
    @basket = order.add_to_basket
  end

  def select_dish(dish, quantity)
    if selection.empty?
      selection << [dish, quantity]
      @basket = create_basket
    else
      @basket.selection << [dish, quantity]
    end
  end

  def review_order
    basket.itemised_bill.each do |item|
      puts ("Dish: #{item[0]}".ljust(SCREEN_WIDTH) + "Quantity: #{item[1]}".ljust(SCREEN_WIDTH/2) + "Price per dish: #{item[2]}".rjust(SCREEN_WIDTH/2) + "Total: #{item[3]}".rjust(SCREEN_WIDTH))
    end
      puts ("GRAND TOTAL: #{basket.total_bill}".center(SCREEN_WIDTH))
  end


  def confirm_order(price)
    @price = price
    fail "Price does not match" if !price_correct?
    checkout_message(order_summary)
  end

  def order_summary
    "Your food is on it's way! GRAND TOTAL: £#{price}"
  end

  private

  attr_reader :meal, :course

  def checkout_message(order_summary)
    CheckoutMessage.new.send_sms(order_summary)
  end

  def price_correct?
    price == basket.total_bill
  end

  def create_basket
    @basket = basket.new(selection, menu_choice)
  end

  def meal_choice_valid?
    meal == :dinner || meal == :lunch
  end

  def course_choice_valid?
    [:starter, :main, :dessert, :all].include? course
  end

end

# def remove(selected)
#   @dish = selected
#   @basket.selection.delete_if{|full_order| @dish.capitalize.to_sym == full_order[0] }
# end
#
# def change_quantity(dish, quantity)
#   @dish = dish
#   @basket.map!{|full_order| @dish.capitalize.to_sym == full_order[0] ? full_order[1] = quantity : full_order[1] }
# end

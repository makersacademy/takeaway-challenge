require_relative 'restaurant'
require_relative 'checkout'

class Takeaway

  def initialize
    @restaurant = Restaurant.new
    @checkout = Checkout.new
  end

  def order
    @restaurant.new_order
    select_items
    @restaurant.show_basket
    correct? ? checkout : order
  end

  private

  def select_items
    @restaurant.show_menu
    puts "Enter a number to add dish to basket"
    index = gets.chomp
    return if index == ''
    @restaurant.select_item(index)
    select_items
  end

  def correct?
    puts "Is this order correct? y/n"
    answer = gets.chomp
    if answer == 'y'
      true
    elsif answer == 'n'
      puts "Lets start again!"
      false
    else
      puts 'Not a valid response.'
      correct?
    end
  end

  def checkout
    @checkout.do
  end

end

jacks = Takeaway.new
jacks.order

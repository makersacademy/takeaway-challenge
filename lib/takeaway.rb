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
    correct? ? checkout : reorder_message ; order
  end

  private

  def select_items
    @restaurant.show_menu
    index = get_index
    return if index.empty?
    @restaurant.select_item(index)
    select_items
  end

  def get_index
    puts "Enter a number to add dish to basket"
    gets.chomp
  end

  def correct?
    answer = ask_correct
    !!answer.match(/^[y|n]$/) ? (return answer == 'y') : invalid_response
    correct?
  end

  def invalid_response
    puts 'Not a valid response.'
  end

  def ask_correct
    puts "Is this order correct? y/n"
    gets.chomp
  end

  def checkout
    @checkout.do
  end

  def reorder_message
    puts "Basket is now Empty, please make your selection again"
  end

end

jacks = Takeaway.new
jacks.order

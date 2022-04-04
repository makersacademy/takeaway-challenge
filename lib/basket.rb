# Basket class
# instance initiated with empty contents list
# instance initiated with zero total 
# can have items added to it via Menu object
# can be asked to view its contents
# can be asked to check total
# can be asked to complete order

require_relative './order'
require_relative './confirmation'

class Basket
  attr_reader :basket_contents, :basket_total

  def initialize(order = Order)
    @basket_contents = []
    @basket_total = 0
    @order = order
  end

  def add_to_basket(dish)
    @basket_contents << dish
    @basket_total += dish.price
    # @basket_contents
  end

  def view_basket
    grouped_basket = group_and_sort_basket
    display_basket_by_dish(grouped_basket)
    display_total
  end

  def basket_and_items_totals_match?
    @basket_total == items_total
  end

  def items_total
    total = basket_contents.inject(0.0) do |total, item|
      total += item.price
    end
  end

  def complete_order
    @order.new(self)
  end

  private

  def group_and_sort_basket
    @basket_contents.group_by { |item| item.name }.sort
  end

  def display_basket_by_dish(grouped_basket) # Consider better formatting for display
    grouped_basket.each do |dish_name, items|
      puts "Item: #{dish_name} Number: #{items.length} Subtotal: £ #{
        items.length * items.first.price}"
    end
  end

  def display_total
    puts "Basket total price: £ " + sprintf("%.2f", @basket_total)
  end

end

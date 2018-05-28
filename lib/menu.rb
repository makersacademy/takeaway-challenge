# Understands the restaurant menu.

require_relative 'restaurant'

class Menu

  attr_reader :dishes, :header, :foot, :order_in_progress, :total_cost,
              :pending_order

  HEADER = "Ty Abs - Whitechapel\nTakeaway Menu"
  FOOT = "Please order before 10pm\nDelivery is available in the E2 area"

  def initialize(dishes = Restaurant.new.dishes, header = HEADER, foot = FOOT)
    @dishes = dishes
    @header = header
    @foot = foot
    @order_in_progress = nil
    @total_cost = 0
    @pending_order = []
  end

  def display
    "#{header}\n#{display_menu}\n#{foot}"
  end

  def display_menu
    dishes
  end

# Refactor this out to Order System
  def order_request
    order_intro = 'What would you like to order?'
    return order_intro unless !!order_in_progress
  end

  def add_to_order(item, number = 1)
    if dishes.has_key?(item)
      number.times do
        @pending_order << item
        @total_cost += dishes[item]
      end
    end

    "#{number} #{item}(s) added to your order."
  end

  def confirm_order(total_submitted)
    message = "Your submitted order total of #{total_submitted} is not correct."
    raise message if total_cost.round(2) != total_submitted
    order_placed
  end

# Remove the argument and use this in an overall order method?
# Probably refactor this out to twillo
  def order_placed
    @order_in_progress = true
    return "Total cost is #{total_cost.round(2)}. Thank you for your order."
  end

end

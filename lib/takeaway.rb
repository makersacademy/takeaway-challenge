require 'menu'
require 'restaurant'

class Takeaway

  attr_reader :restaurant, :phone_no, :order, :payment_card_no, :order_open
  def initialize(restaurant, phone_no)
    @restaurant = restaurant
    @phone_no = phone_no.to_s
    @order = []
    @payment_card_no = nil
    @order_open = true
  end

  def read_menu
    @restaurant.display_menu
  end

  def select_dish(dish, quantity = 1)
    quantity.times do
      @order << dish
    end
  end

  def show_basket
    #@order.uniq.each
  end


end

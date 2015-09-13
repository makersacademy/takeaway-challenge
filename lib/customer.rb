require_relative 'takeaway'

class Customer
  include Takeaway

  attr_accessor :order_basket, :order_total, :total_items

  def initialize
    @order_basket = {}
    @order_total = 0
    @total_items = 0
  end

  def view_menu
    menu
  end

  def select_item(item, quantity)
    fail "Sorry, that item is not on the menu." unless menu.key?(item)
    add_to_order_basket(item, quantity)
    update_order_total(item, quantity)
    update_total_items(quantity)
  end

  def receipt
    "Your order has " + total_items.to_s + " items with a total of £" + order_total.to_s
  end

  def make_payment
    "Please pay" + order_total.to_s + "now to confirm your order."
    payment = gets.chomp
    payment.to_s
    if payment != order_total.to_s
       raise "Payment does not match total, please make payment."
     else
      "Thank you! Your order was placed and will be delivered by" + delivery_time.to_s + "."
    end
  end


private

  def add_to_order_basket(item, quantity)
     @order_basket[item] = quantity
  end

  def update_order_total(item, quantity)
    @order_total += menu[item] * quantity
  end

  def update_total_items(quantity)
    @total_items += quantity
  end

  def delivery_time
    @delivery_time = Time.now (+ 1)
  end


end

require_relative 'takeaway.rb'
require_relative 'text.rb'

class Customer

  attr_reader :order_basket, :order_total, :total_items, :takeaway

  def initialize(klass = Takeaway)
    @takeaway = klass.new
    @order_basket = {}
    @order_total = 0
    @total_items = 0
  end

  def view_menu
    @takeaway.menu.each { |key, value| "#{key} - #{value}"}
  end

  def select_item(item, quantity)
    fail 'Sorry, that item is not on the menu.' unless @takeaway.menu.key?(item)
    update_order_basket(item, quantity)
    update_order_total(item, quantity)
    update_total_items(quantity)
  end

  def receipt
    order_basket.map do |item, quantity|
       "#{quantity}x #{item} - £#{takeaway.menu[item] * quantity}"
    end.join(', ') + '0'.to_s
  end

  def total_cost
    '£' + order_total.to_s + '0'
  end

  def pay(amount)
    if amount != total_cost.to_s
      fail 'Payment does not match total, please try payment again'
    else
      'Thank you for your order. You will receive text confirmation shortly.'
      Text.new.send_message
    end
  end

    private

      def update_order_basket(item, quantity)
        @order_basket[item] = quantity
      end

      def update_order_total(item, quantity)
        @order_total += takeaway.menu[item] * quantity.to_i
      end

      def update_total_items(quantity)
        @total_items += quantity
      end
end

require_relative 'messenger'

class Order
  attr_reader :contents, :summary

  def initialize
    @contents = []
  end

  def add(item, item_price, quantity = 1)
    @contents.any? { |h| h[:item] == item } ? increase_order_quantity(item, quantity) : add_new_item(item, item_price, quantity)
  end

  def increase_order_quantity(item, quantity)
    @contents[@contents.index { |h| h[:item] == item }][:quantity] += quantity
  end

  def add_new_item(item, item_price, quantity)
    new_addition = {
    :item => item,
    :quantity => quantity,
    :item_price => item_price
    }
    @contents << new_addition
  end

  def calculate_order_total
    @contents.each { |i| i.merge!(sub_total: (i[:item_price] * i[:quantity])) }
    @order_total = 0
    @contents.each { |i| @order_total += (i[:item_price] * i[:quantity]) }
  end

  def show_summary
    calculate_order_total
    @summary = "here is your order\n"
    @contents.each { |i| @summary << "#{i[:item]} x#{i[:quantity]}  - £#{(i[:item_price]) * (i[:quantity])}\n" }
    @summary << "----------\nOrder total is £#{@order_total}"
    puts @summary
  end

  def place_order(messenger = Messenger.new)
    messenger.send_message
  end
end

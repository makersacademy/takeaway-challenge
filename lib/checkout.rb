require_relative 'order'

class Checkout

  attr_accessor :order

  def initialize (order)
    @order = order
  end

  def show_final_order
    order.dishes.each { |k, v| "#{k}: #{v}" }
  end

  def final_total
    order.dishes.map(&:values).flatten.inject{ |sum, x| sum + x }
  end

  def print_receipt
    #@dishes.each { |k| "Name: #{k[:name]}; Price: £#{k[:price]}" }
  end

end
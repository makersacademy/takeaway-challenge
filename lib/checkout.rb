require_relative 'order'

class Checkout

  attr_accessor :order

  def initialize (order)
    @order = order
  end

  def show_final_order
    true
  end

  def print_receipt
    #@dishes.each { |k| "Name: #{k[:name]}; Price: £#{k[:price]}" }
  end

end
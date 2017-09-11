require_relative 'menu'
require_relative 'text_confirm'

class Order

  attr_reader :current_order, :basket, :balance, :total

  def initialize
    @basket = []
    @balance = 0
    @current_order = { item: nil, quantity: nil, price: nil }
  end

  def price(price)
    @price = price
  end

  def item_quantity(quantity)
    @item_quantity = quantity
  end

  def choice(choice)
    @choice = choice
  end

  def add_to_current_order
    @balance += (@item_quantity * @price)
    @current_order[:item] = @choice
    @current_order[:quantity] = @item_quantity
    @current_order[:price] = (@item_quantity * @price)
  end

  def add_to_basket
    puts "#{@quantity} #{@choice} ordered!"
    @basket << @current_order
    @current_order = { item: nil, quantity: nil, price: nil }
  end

  def checkout(text_confirm=TextConfirm.new)
    text_confirm.text_confirmation
  end

  def empty_basket
    @basket = []
  end

  def total
    @basket.collect { |x| x[:price] }.inject(&:+)
  end
end

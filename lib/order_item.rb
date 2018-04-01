require_relative 'order_item_printer'

class OrderItem
  include OrderItemPrinter

  attr_reader :price, :description, :id

  def initialize dish, quantity
    @dish = dish
    @quantity = quantity
    @id = id_generator
    @price = calculate_price
    @description = describe
  end

  private
  def id_generator
    ([Kernel.rand(65..90).chr] + Array.new(4) { Kernel.rand(0..9) }).join
  end

  def calculate_price
    @dish.price * @quantity
  end

  def describe
    pretty_print(id: @id, dish: @dish.describe, quantity: @quantity, price: @price)
  end
end


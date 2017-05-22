require_relative 'display'

class InvalidOption < StandardError; end

class Order

  attr_reader :basket, :messager

  def initialize(messager = Messager.new, printer = Printer.new)
    @basket = Hash.new(0)
    @messager = messager
    @print = printer
  end

  def add_dish(dish, quantity = 1)
    @basket[dish] += quantity
    @print.order_update('add',dish,quantity)
  end

  def remove_dish(dish, quantity = 1) #Make custom error!
    fail(InvalidOption) if not_in_basket?(dish,quantity)
    @basket[dish] -= quantity
    @print.order_update('remove',dish,quantity)
  end

  def review_order
    fail("Nothing in basket") if @basket.empty?
    @basket.map { |dish,quantity| [dish.name, quantity] }.to_h
  end

  def order_total
    @basket.keys.map { |dish| dish.price.to_f * @basket[dish].to_f }.reduce(:+)
  end

  def confirm_order
    @messager.send_confirmation(order_total)
  end

  private

  def not_in_basket?(dish,quantity)
    @basket[dish] < quantity || @basket[dish] == nil
  end

end

require 'calculator'

class Order

  attr_reader :order

  def initialize(calculator = Calculator.new)
    @order = []
    @summarised_order = Hash.new(0)
    @calculator = calculator
  end

  def add(food_item, quantity)
    quantity.times { @order << food_item }
  end

  def remove(food_item, quantity)
    quantity.times { @order.delete_at(@order.index(food_item)) }
    @order
  end

  def display_order
    summarise_order(@order)
    @summarised_order.each { |food_item, quantity|
      puts "#{food_item.name} x #{quantity} @ : £%.2f" % food_item.price.to_s
    }
    puts "Total due: £%.2f" % total_price(@summarised_order).to_s
  end

  private

  def summarise_order(order)
    order.each { |food_item|
      @summarised_order[food_item] += 1
    }
  end

  def check_order_for(food_item)
    !@order.include?(food_item)
  end

  def check_order_quantity(food_item, quantity)
    @order.count(food_item) < quantity
  end

  def total_price(summarised_order)
    @calculator.total(summarised_order)
  end
end

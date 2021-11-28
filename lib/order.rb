require 'menu'

class Order
  attr_reader :summary

  def initialize(restaurant)
    @summary = {}
    @menu = Menu.new(restaurant)
  end

  def add(dish, quantity)
    price = @menu.dishes[dish].to_f * quantity
    add_to_summary(dish, quantity, price)
    @summary
  end

  def print_summary
    @summary.each { |dish, hash| puts "#{hash[:quantity]} - #{dish} - £#{"%.2f" % hash[:price]}" }
  end

  def checkout(name, number, address)
    puts "#{name}, #{address}, #{number}\n#{@menu.restaurant}\n****"
    print_summary
    total = @summary.map { |_, hash| hash[:price] }.sum
    puts "TOTAL: £#{"%.2f" % total}\n****"
  end

  private

  def add_to_summary(dish, quantity, price)
    if @summary.has_key?(dish)
      @summary[dish][:quantity] += quantity
      @summary[dish][:price] += price
    else
      @summary[dish] = { quantity: quantity, price: price }
    end
  end
end

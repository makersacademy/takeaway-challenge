require_relative 'restaurant'

class Order
  attr_reader :customer
  attr_reader :order

  def initialize(customer, restaurant)
    @restaurant = restaurant
    @customer = customer
    @order = []
  end

  def show_order
    @order.each do |item|
      item.each do |name, price|
        puts "#{name} - £#{price}"
      end
    end
    puts "Total - #{calculate_bill}"
  end

  def show_menu
    @restaurant.show_menu
  end

  def add_to_order(item, quantity)
    quantity.times do
      @order << @restaurant.order_item(item)
    end
  end

  def complete_order
    puts "You ordered:"
    show_order
    confirmation
  end

  private
  def calculate_bill
    bill = 0
    @order.each do |item|
      item.each do |name, price|
        bill += price
      end
    end
    bill.round(2)
  end

  def confirmation
    reply = nil
    until reply == 'y' || reply == 'n'
      puts "Confirm? (Y/N)"
      reply = gets.chomp
      reply.downcase!
    end
  end
end

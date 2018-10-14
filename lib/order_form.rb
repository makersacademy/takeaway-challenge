require_relative 'menu'
require_relative 'invoice'
require 'confirmation'

class OrderForm
  require 'twilio-ruby'

  def initialize
    @order = []
    @menu = Menu.new
    @invoice = Invoice.new(@order)
    @total_price = 0
  end

  attr_reader :order, :invoice, :menu

  def print_menu
    @menu.list.each do |food, price|
      puts "#{food.capitalize}: $#{price}"
    end
  end

  def add(item)
    return "Cannot add to order: Item is not on menu." unless @menu.list.key?(item.downcase)
    @menu.list.each do |food, price|
      @order << ({food => price}) if item.downcase == food
      @total_price += price if item.downcase == food
      puts "One #{food} has been added to your order." if item.downcase == food
    end
  end

  def remove(item)
    @order.each do |ordered_item|
      ordered_item.each do |food, price|
          order.delete(ordered_item) if item.downcase == food
          @total_price -= price if item.downcase == food
          puts "One #{food} has been removed from your order." if item.downcase == food
      end
    end
  end

  def purchase
    return "Oops! Something went wrong. Please try again." unless @invoice.total == @total_price
    text("Thank you! Your order was placed and will be delivered before #{Time.new + 3600}")
  end
end

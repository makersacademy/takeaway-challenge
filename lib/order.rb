require './lib/menu.rb'

class Order
  attr_reader :order, :current_total, :bill
  def initialize
    @order = []
  end

  def add_to_order(food, quantity)
    fail "This item is not on the menu" if !item_exist?(food)
    @order << {item: food, quantity: quantity}
  end

  def current_total
    @current_total = calc_total
  end

  def view_order
    @order.each do |item|
      puts "#{item[:item]} x#{item[:quantity]}"
    end
    puts current_total
  end

  def checkout
    @bill = Bill.new
  end

  private

  def calc_total
    total = 0
    @order.each do |item|
      Menu::MENU.each do |menu_item|
        if menu_item[:dish] == item[:item]
          total += menu_item[:price] * item[:quantity]
        end
      end
    end
    total
  end

  def item_exist?(food)
    !Menu::MENU.select { |item| item[:dish] == food }.empty?
  end
end

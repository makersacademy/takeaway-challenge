require_relative "./dish.rb"
require_relative "./menu.rb"
require_relative "./texting.rb"

class Order
  attr_reader :dishes

  def initialize(menu)
    @menu = menu
    @dishes = []
  end

  def add_to_order(id, quantity = 1)
    @dishes << { dish: @menu.get_by_id(id), quantity: quantity }
  end

  def remove_from_order(id, quantity = 1)
    @dishes.each do |item|
      item[:quantity] -= quantity if item[:dish] == @menu.get_by_id(id)
    end
    clean_order
  end

  def check_order
    print_header
    @dishes.each do |item|
      puts item[:dish].print_dish + "---- #{item[:quantity]}"
    end
    print_footer
  end

  def place_order

  end

  private

  def clean_order
    @dishes.delete_if { |item| item[:quantity] <= 0 }
  end

  def print_header
    puts "ID: dish -------- price per dish ------ quantity"
  end

  def print_footer
    puts "Total: #{total_price}"
  end

  def total_price
    total = 0
    @dishes.each { |item| total += (item[:dish].price * item[:quantity]) }
    total
  end
end

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
    fail "Dish not in the menu" unless !!@menu.get_by_id(id)
    if is_in_order?(id)
      @dishes.each { |item| item[:quantity] += quantity if item[:dish].id == id }
    else
      @dishes << { dish: @menu.get_by_id(id), quantity: quantity }
    end
  end

  def remove_from_order(id, quantity = 1)
    fail "Not such dish" unless is_in_order?(id)
    @dishes.each { |item| item[:quantity] -= quantity if item[:dish].id == id }
    clean_order
  end

  def check_order
    print_header
    @dishes.each do |item|
      p item[:dish].print_dish + "---- #{item[:quantity]}"
    end
    print_footer
  end

  def place_order(texting_class = Texting)
    # puts "Thank you! Your order was placed and will be delivered"\
    #  " before #{DateTime.now.hour + 1}:#{DateTime.now.min}"
    texting_class.send_sms("Thank you! Your order was placed and will be"\
    " delivered before #{Time.now.hour + 1}:#{Time.now.min}")
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

  def is_in_order?(id)
    @dishes.any? { |item| item[:dish].id == id }
  end
end

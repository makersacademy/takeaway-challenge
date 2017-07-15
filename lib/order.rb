require_relative "text"

class Order
  attr_reader :dishes, :text_confirmation

  def initialize
    @dishes = Array.new
  end

  def add(dish)
    dishes << dish
  end

  def total
    puts "Order total: £#{dishes.map { |dish| dish.price }.reduce(:+)}"
  end

  def display
    dishes.each do |dish|
      puts "#{dish.name} £#{dish.price}"
    end
    total
  end

  def submit(phone_number)
    raise "Please add at least one item to your order" if dishes.empty?
    @text_confirmation = Text.new(phone_number)
    display
    puts "Order submitted"
  end
end

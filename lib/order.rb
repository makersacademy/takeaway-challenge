require_relative "text"

class Order
  attr_reader :text_confirmation
  VALID_NUMBER = /07(\d{9})/

  def initialize
    @dishes = Array.new
  end

  def add(dish)
    dishes << dish
  end

  def total
    puts "Order total: £#{sum_dishes}"
  end

  def display
    dishes.each do |dish|
      puts "#{dish.name} £#{dish.price}"
    end
    total
  end

  def submit(phone_number)
    submission_errors(phone_number)
    @text_confirmation = Text.new(phone_number)
    end_order
  end

  def complete?
    complete
  end

  private
  attr_reader :dishes, :complete

  def sum_dishes
    dishes.map { |dish| dish.price }.reduce(:+)
  end

  def submission_errors(phone_number)
    raise "Please add at least one item to your order" if dishes.empty?
    raise "Please enter a valid UK phone number" unless phone_number.match(VALID_NUMBER)
  end

  def end_order
    puts "Order submitted"
    @complete = true
  end
end

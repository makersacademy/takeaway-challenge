class Printer

  attr_reader :restaurant

  def initialize(restaurant)
    @restaurant = restaurant
  end

  def interactive_menu
    puts '1. See Menu'
    puts '2. Choose Item'
    puts '3. Checkout'
    puts '4. Confirm'
    puts '9. Exit'
  end

  def print_menu
    restaurant.menu.items.each_with_index do |item, index|
        puts "#{index + 1}. #{item.name}: £#{item.price}"
    end
  end

  def input_item_selection
    puts "Please input the item number of your selection"
  end

  def input_quantity
    puts "Please enter the quantity"
  end

  def print_confirmation
    "Your order has been placed. You'll be munching on it by #{delivery_time}"
  end

  private
  def delivery_time
    (Time.new + 3600).strftime("%H:%M")
  end

end

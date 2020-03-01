require_relative 'menu'

class Order

  def initialize(menu = Menu.new)
    @order = []
    @total = 0
    @menu = menu
  end

  def display
    raise "No items in basket. Please select dishes" if @order.length.zero?
    puts left("Dish") + "Quantity".center(10) + "Amount".center(10)
    @order.each do |item|
      puts left("#{item[:dish]}") + "#{item[:quantity]}".center(10) + "#{currency item[:amount]}".center(10)
    end
    puts "\nTotal order: #{currency @total}"
  end

  def add(dish, quantity)
    price = find_price dish
    @total += price * quantity
    @order.push({dish: dish, quantity: quantity, amount: price * quantity})
  end

  private
  def find_price dish
    dish_details = @menu.menu.select { |item| item[:name] == dish }[0][:price]
  end

  def currency money
    '£%.2f' % money
  end

  def left string
    '%-10s' % string
  end
end

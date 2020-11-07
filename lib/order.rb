require_relative 'menu'
class Order

  attr_reader :total, :selected_items, :menu

  def initialize
    @total = 0
    @selected_items = []
  end

  def see_menu
    @menu = {"Burger" => 5, "Fries" => 3, "Drink" => 2}
    @menu.each { |item, price| puts "Item: #{item}, Price: £#{price}"}
  end

  def select(dish)
    @selected_items << dish
    @total = @total + @menu[dish]
  end

  def view
    puts @selected_items
    puts @total
  end

  def place(phone)
    puts "Thank you! Your order was placed and will be delivered before 18:52"
  end

end

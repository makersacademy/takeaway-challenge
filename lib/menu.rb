require './lib/order.rb'

class Menu

  MENU = [
    {dish: "Egg Fried Rice", price: 1.50},
    {dish: "Sweet and Sour Chicken", price: 6.50},
    {dish: "Chow Mein", price: 7.00},
    {dish: "Satay Chicken", price: 7.50},
    {dish: "Crispy Aromatic Duck", price: 12.00},
    {dish: "Braised Pork Belly", price: 10.00},
    {dish: "Crispy Beef", price: 9.00}
  ]

  attr_reader :my_order

  def view_menu
    MENU.each do |item|
      puts "#{item[:dish]} - £#{item[:price]}"
    end
  end

  def order
    @my_order = Order.new
  end
end

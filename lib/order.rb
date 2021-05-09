class Order 
  attr_reader :order_list

  MENU = [
    {dish: 'Fish',     price: 9},
    {dish: 'Curry',    price: 9},
    {dish: 'Rice',     price: 3},
    {dish: 'Steak',    price: 10},
    {dish: 'Soup',     price: 7},
    {dish: 'Sandwich', price: 3},
    {dish: 'Squirrel', price: 100}
  ]

  def initialize(menu = Menu.new)
    @menu = menu
    @order_list = []
  end

  def display
    MENU.each do |element|
      puts "#{element[:dish]}, #{element[:price]}"
    end 
  end

  def order_item(dish)
    MENU.each { |element| order_list << element if element[:dish] == dish }
  end

  def items_in_order
    string = ''
    order_list.each { |element| string += "#{element[:dish]}, "}
    string.chomp(', ')
  end

  def price
    total = 0
    order_list.each { |element| total += element[:price] }
    total
  end
end
class Takeaway

  attr_reader :menu, :order

  def initialize
    @menu = [ {food: 'pizza', price: 5},
              {food: 'curry', price: 7},
              {food: 'rice', price: 3},
              {food: 'chips', price: 11},
              {food: 'lasagne', price: 13}
            ]
    @order = []
    @current_item = {food: nil, quantity: nil}
  end

  def list_menu
    puts @menu
  end

  def new_order
    list_menu
    order_constructor
    order_summary
  end

  def order_constructor
    puts "\nTo add an item, type the food type followed
by the quantity.\n\nTo see an order summary, press enter twice.\n"
    food_type     = gets.chomp
    food_quantity = gets.chomp
    until food_type == "" && food_quantity == "" do
      @current_item[:food] = food_type
      @current_item[:quantity] = food_quantity.to_i
      @order << @current_item
      @current_item = {food: nil, quantity: nil}
      food_type     = gets.chomp
      food_quantity = gets.chomp
    end
  end

  def order_summary
    puts "Order summary:\n"
    puts @order
    puts "Total cost: £#{price_calculator}"
  end

  def test
    @order[0][:quantity]*@menu[0][:price]
  end

  def price_calculator
    price = 0
    running_total = 0
    @order.each do |x|
      @menu.each do |y|
        if x[:food] == y[:food]
          price = x[:quantity] * y[:price]
          running_total += price
        end
      end
    end
  running_total
  end
end

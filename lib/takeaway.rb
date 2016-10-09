class Takeaway

  attr_reader :menu, :order

  def initialize
    @menu = [ {food: 'pizza', price: 10},
              {food: 'curry', price: 8},
              {food: 'rice', price: 2},
              {food: 'chips', price: 2},
              {food: 'lasagne', price: 8}
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
      @current_item[:quantity] = food_quantity
      @order << @current_item
      @current_item = {food: nil, quantity: nil}
      food_type     = gets.chomp
      food_quantity = gets.chomp
    end
  end

  def order_summary
    
  end
end

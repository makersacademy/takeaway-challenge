
class Takeaway

  attr_reader :pizzas, :order

  def initialize
    @pizzas = [
      { name: :Margherita, price: 9 },
      { name: :Napoli, price: 9 },
      { name: :Marinara, price: 7 },
      { name: :Pepperoni, price:10 },
      { name: :Calabrese, price: 10 },
      { name: :Funghi, price: 8 },
      { name: :Napoletana, price: 9 }
    ]
  end 

  def menu
  index = 1
    @pizzas.each do |pizza|
      puts "#{index}: #{pizza[:name]} (#{pizza[:price]})"
    end 
  end 

  def create_order(order = Order.new)
    @order = order
  end 

  def add_order(user_order)
    pizza = @pizzas[user_order -1]
    @order.add_selected_item(pizza)
  end 

  def confirm_order
    @order.confirm_order
  end 

  def display_order(order = @order)
    order.display_items
    puts "Order Total = £#{@order.total_price}"
  end

  def place_order(order = @order)
    order.confirm_order
    puts "Order successfully placed!"
  end

end

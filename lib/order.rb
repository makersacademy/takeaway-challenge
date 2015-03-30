require_relative 'customer'
require_relative 'menu'


class Order
  attr_accessor :menu, :order_list

  def initialize 
    @menu = 
    @order_list = []
  end
    
  def add_menu menu
    @menu = menu
  end 

  def present_menu
    menu.present_menu
  end

  def pick_items(*options)
    options.each { |i| order_list << i }
  end

  def place_order 
    price_list = order_list.map { |key| menu.items[key] }
    price_list.reduce(:+)
  end  

  def confirm_order

    @client.messages.create(
    from: '+441582214383',
    to: '+447799296335',
    body: '"Thank you! Your order was placed
     and will be delivered before 18:52'
    )

  end  

end  
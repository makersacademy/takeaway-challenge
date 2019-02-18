require_relative 'dish.rb'
require_relative 'menu.rb'
require_relative 'basket_item.rb'
require_relative 'basket.rb'
require_relative 'order.rb'
require_relative 'message_sender.rb'
require_relative 'customer.rb'
class Takeaway
  attr_reader :basket, :customer, :message_sender, :menu, :order_class, :order
  def initialize(menu_class = Menu, dish_class = Dish,
                 basket = Basket.new,
                 message_sender_class = MessageSender,
                 order_class = Order, customer)
    @menu_class = menu_class
    @dish_class = dish_class
    @basket = basket
    @customer = customer
    @message_sender_class = message_sender_class
    @message_sender = @message_sender_class.new

    @order_class = order_class
  end

  def create_menu(dish_list = [])
    @menu = @menu_class.new(dish_list)
  end

  def create_dish(name, price)
    @dish = @dish_class.new(name, price)
  end

  def select_item_to_buy(dish)
    @basket.add_item(@menu.select_dish(dish))
  end

  def create_order
    @order = @order_class.new(@basket.basket_items,
                              @basket.basket_total_price,
                              @customer.address, @customer.phone_number,
                              @message_sender)
  end

  def confirm_order

    @order.confirm
  end

end

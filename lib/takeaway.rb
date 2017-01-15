require_relative 'menu'
require_relative 'order'
require_relative 'sms'

class Takeaway

attr_reader :price, :current_order

  def initialize(menu:, config:, order: nil, sms: nil)
     @menu = menu
     @order = order || Order.new(menu)
     @sms = sms || Sms.new
    #  @price = []
    #  @current_order = []

  end


  def place_order(dishes)
    add_dishes(dishes)
    sms.deliver
    order.total
  end
  # def show_menu
  #    @menu = Menu.new.dishes
  #  end

  # def place_order(selection, quantity)
  #
  #   if @menu.has_key?(selection)
  #   @price << [quantity * @menu[selection].to_f]
  #   running_total = quantity * @menu[selection]
  #   @current_order << {:Selection => selection, :Quantity => quantity, :Total => running_total}
  #   end
  # end

  def list_dishes
    menu.show_menu
  end

  def to_pay
    total
  end

private

attr_reader :menu, :order, :total, :sms


  def add_dishes(dishes)
    dishes.each do |dish, quantity|
      order.add(dish, quantity)
    end
  end

  def total
    @order_total = @price.inject(:+)
    @order_total.inject(:+)
  end
end

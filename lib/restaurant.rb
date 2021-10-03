class Restaurant 
  attr_reader :order_history, :order, :text
  attr_accessor :calc

  def initialize(order_class = Order, text_class = Text, sender_class = Sender)
    @order_class = order_class
    @order_history = []
    @order = @order_class.new
    @calc = 0
    @text_class = text_class
    @text = nil
    @sender_class = sender_class
    @sender = @sender_class.new
  end 

  def view_menu 
    @order.menu_listing
  end

  def start_order
    @order = @order_class.new
  end

  def scrap_order
    @order = @order_class.new
  end

  def add_items(item, quantity = 1)
    @order.add_dish(item, quantity)
  end

  def complete_order
    raise "There has been an issue with your order, please try again later" if check_total == false
    create_text(@order)
    @order_history << @order 
    send_text(@text)
  end 

private 

  def check_total
    @order.dishes.each { |dish| @calc += dish.price }
    @order.total == @calc
  end

  def create_text(order)
    @text = @text_class.new
    @text = @text.text(order)
  end 

  def send_text(_text)
    @sender.send_text(@text)
  end
  

end

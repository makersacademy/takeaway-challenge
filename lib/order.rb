class Order 
  attr_reader :my_order 

  def initialize
    @my_order = []
  end

  def add_dish_to_order(name, quantity)
    @name, @quantity = name, quantity
    @my_order << { @name => @quantity }
    return "#{quantity} x #{name} added to your order"
  end

  def view_order
    order_display
  end

  def order_total
    sum = 0
    menu = Menu.new.access_menu 
    @my_order.each do |item|
      item.each do |name, quantity|
        menu.each do |dish| 
          dish.each { |item, price| sum += (price * quantity) if name == item } 
        end
      end
    end
    sum
  end

  def price
    "Customer to pay £#{order_total}"
  end

  private

  def order_display
    format = ["You have ordered:"]
    @my_order.each do |item| 
      item.each { |name, quantity| format << "#{quantity} x #{name}" }
    end
    format.join("\n")
  end
end

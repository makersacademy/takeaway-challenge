require_relative 'order_form'
class Customer

  attr_reader :order_form
  
  def initialize
    @order_form = OrderForm.new
  end

  def view_dishes
    order_form.show_dishes
  end

  def select_dish dish, quantity
    order_form.add_dish dish, quantity
  end

end
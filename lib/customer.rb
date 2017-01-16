require_relative 'menu'
require_relative 'order'

class Customer
  attr_reader :pre_order, :estimated_amount, :calculated_amount, :pre_order_status, :order, :menu

  def initialize(name = "Pedro", phone_number = "+4407342229369")
    @name = name
    @phone_number = phone_number
    @estimated_amount = 0
    @calculated_amount = 0
    @pre_order_status = false
    @menu
  end

  def look_menu(menu = Menu.new)
    @menu = menu
    @menu.printer
  end

  def choose_dishes(pre_order = [], estimated_amount)
    @pre_order = pre_order
    @estimated_amount = estimated_amount
    @pre_order_status = true
  end

  def calculate_amount
    no_pre_order_error_condition
    @order = Order.new(@pre_order)
    @calculated_amount = @order.calculate_total
  end

  def amount_check?
    calculate_amount
    @estimated_amount == @calculated_amount
  end

  def place_order
    no_pre_order_error_condition
    raise "Incorrect sum" if !amount_check?
    @order.confirmation(@name, @phone_number)
  end

  def verify_order
    no_pre_order_error_condition
    @order.bill.descriminated_bill
  end

  def no_pre_order_error_condition
    raise "The order was not submitted yet" if @pre_order_status == false
  end
end

require './lib/menu.rb'

class PlaceOrder

  attr_accessor :order, :users_total, :total, :phone_number

  def initialize
    @order = []
    @users_total
    @total
    @phone_number
  end

  def ask_for_order
    p "Please place your order in the form of order number, quantity. E.g. '23, 7'"
  end

  def take_order
    order_array = gets.chomp
    p order_array
    @order = order_array.split(%r{,\s*})
    p @order
  end

  def ask_for_total
    p "Please write your expected order total below e.g 12.36"
  end

  def take_user_total
    @users_total =  gets.chomp.to_f
  end

  def calculate_total
    # take first item, assume quantity 1
    menu_item = Menu.new.nested_menu
    first_index = @order[0].to_i - 1
    second_index = @order[1].to_f
    @total = (menu_item[first_index][1] * second_index)
  end

  def total_agreed?
    @users_total == @total
  end

  def confirm_order
    fail "Total incorrect. Order failed" if total_agreed? == false

    p "Your order has been placed. Please provide your phone number below."
  end

  def take_number
    @phone_number = gets.chomp
  end

end

require './lib/menu.rb'

class PlaceOrder

  attr_accessor :order, :users_total, :total, :phone_number, :order_start

  def initialize
    @order = []
    @users_total
    @total
    @phone_number
    @order_start =[]
  end

  def ask_for_order
    p "Please place your order in the form of order number, quantity, and start on a new line for each item E.g. 1, 7[return key]2, 4,[return key][return key]"
  end

  def multi_gets all_text=[]
    while (text = gets) != "\n"
      all_text << text.chomp
    end
    @order_start = all_text
  end

  def take_order
      @order = @order_start
  end

  def ask_for_total
    p "Please write your expected order total below e.g 12.36"
  end

  def take_user_total
    @users_total =  gets.chomp.to_f
  end

  def calculate_total
    # take first item, assume quantity 1
    p @order
    menu_item = Menu.new.nested_menu
    if @order.length == 2
      first_index = @order[0].to_i - 1
      second_index = @order[1].to_f
      @total = (menu_item[first_index][1] * second_index)
    else
      first_index = @order[0][0].to_i - 1
      second_index = @order[0][1].to_f
      third_index = @order[1][0].to_i - 1
      fourth_index = @order[1][1].to_f
      @total = (menu_item[first_index][1] * second_index) + (menu_item[third_index][1] * [fourth_index])
    end
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

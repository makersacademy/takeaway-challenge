require 'twilio-ruby'
require_relative 'order'

class Menu
  attr_reader :balance, :current_order, :basket

  def initialize
    @order = Order.new
    @menu_items = { rice: 1, curry: 5, chips: 2, garlicbread: 4 }
  end

  def print_menu
    puts
    puts "---- MAKERS EXPRESS ----".center(70)
    puts "1. Rice - £1.00".center(70)
    puts "2. Curry - £5.00".center(70)
    puts "3. Chips - £2.00".center(70)
    puts "4. Garlic Bread - £4.00".center(70)
    puts "---------------------------".center(70)
    puts "5. CHECK BASKET".center(70)
    puts "6. CHECKOUT".center(70)
    puts "7. EXIT MENU".center(70)
    puts
  end

  def get_order(order_choice, quantity=0)
    case order_choice
    when 1
      @order.choice("Rice")
      @order.item_quantity(quantity)
      @order.price(@menu_items[:rice])
      send_to_basket
    when 2
      @order.choice("Curry")
      @item_quantity = quantity
      @price = @menu_items[:curry]
      send_to_basket
    when 3
      @order.choice("Chips")
      @item_quantity = quantity
      @price = @menu_items[:chips]
      send_to_basket
    when 4
      @order.choice("Garlic Bread")
      @item_quantity = quantity
      @price = @menu_items[:garlicbread]
      send_to_basket
    when 5
      if @order.basket == []
        puts "Your basket is empty"
      else
        puts "Your current basket"
        puts @order.basket
      end
    when 6
      puts "CHECKING OUT..."
      checkout
    when 7
      exit
    else
      puts "Not on Menu, try again"
    end
  end

  def send_to_basket
    @order.add_to_current_order
    @order.add_to_basket
  end

  def checkout(total_to_pay)
    sum = total_to_pay
    if sum != @order.total
      puts "wrong total try again"
    else
      puts "your order is on the way!"
      @order.empty_basket
    end
  end

  def text_confirmation
    account_sid = "AC0de1208f7ea73d489b41ecda8c5ed54f"
    auth_token = "55fba7009608465f493b4395eb00c633"

    @client = Twilio::REST::Client.new account_sid, auth_token
    message = @client.messages.create(
        body: "Thank you! Your MAKERS EXPRESS order'll be there before #{(Time.now + (60 * 60)).strftime("%H:%M:%S")}",
        # to: "***********",
        from: "+441902504480")

        puts message.sid
  end
end

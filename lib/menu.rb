require 'twilio-ruby'

class Menu
  attr_reader :balance, :current_order, :basket

  def initialize
    @basket = []
    @balance = 0
    @menu_items = { rice: 1, curry: 5, chips: 2, garlicbread: 4 }
    @current_order = { item: nil, quantity: nil, price: nil }
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
    get_order(order_choice=gets.chomp.to_i)
  end

  def main_menu
    loop do
      print_menu
      get_order(gets.chomp.to_i)
    end
  end

  def get_order(order_choice)
    case order_choice
    when 1
      @choice = "Rice"
      @price = @menu_items[:rice]
      quantity_check
    when 2
      @choice = "Curry"
      @price = @menu_items[:curry]
      quantity_check
    when 3
      @choice = "Chips"
      @price = @menu_items[:chips]
      quantity_check
    when 4
      @choice = "Garlic Bread"
      @price = @menu_items[:garlicbread]
      quantity_check
    when 5
      if @basket == []
        puts "Your basket is empty"
      else
        puts "Your current basket"
        puts @basket
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

  def quantity_check
    # return true
    puts "How many?"
    quantity(gets.chomp.to_i)
    puts
  end

  def quantity(item_quantity)
    @item_quantity = item_quantity
    add_to_current_order
    add_to_basket
  end

  def add_to_current_order
    @balance += (@item_quantity * @price)
    @current_order[:item] = @choice
    @current_order[:quantity] = @item_quantity
    @current_order[:price] = (@item_quantity * @price)
  end

  def add_to_basket
    puts "#{@quantity} #{@choice} ordered!"
    @basket << @current_order
    total
    @current_order = { item: nil, quantity: nil, price: nil }
    puts
    main_menu
  end

  def checkout
    puts "total to pay?"
    sum = gets.chomp.to_i
    if sum != total
      puts "wrong total"
      checkout
    else
      # text_confirmation
      puts "your order is on the way!"
      @basket = []
    end
  end

  def total
    @basket.collect { |x| x[:price] }.inject(&:+)
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

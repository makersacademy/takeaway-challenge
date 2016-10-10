require 'twilio-ruby'

class Takeaway

  attr_reader :menu, :order

  def initialize
    @menu = [ {food: 'pizza', price: 13},
              {food: 'curry', price: 7},
              {food: 'rice', price: 3},
              {food: 'chips', price: 11},
              {food: 'lasagne', price: 13}
            ]
    @order = []
    @current_item = {food: nil, quantity: nil}
  end

  def list_menu
    puts @menu
  end

  def new_order
    list_menu
    order_constructor
    check_order
  end

  def order_constructor
    puts "\nTo add an item, type the food type and press 'enter'.
Then type the amount needed and press 'enter'. Carry on until
you have finished your order, then press 'enter' twice to see an
order summary.\n\nTo add more items, re-run .new_order.\n\nTo
check order, run .check_order\n\nTo place order, run .place_order\n"
    food_type     = gets.chomp
    food_quantity = gets.chomp
    until food_type == "" && food_quantity == "" do
      @current_item[:food] = food_type
      @current_item[:quantity] = food_quantity.to_i
      @order << @current_item
      @current_item = {food: nil, quantity: nil}
      food_type     = gets.chomp
      food_quantity = gets.chomp
    end
  end

  def check_order
    puts "Order summary:\n"
    puts @order
    puts "Total cost: £#{price_calculator}"
  end

  def price_calculator
    running_total = 0
    @order.each do |x|
      @menu.each do |y|
        if x[:food] == y[:food]
          price = x[:quantity] * y[:price]
        running_total += price
        end
      end
    end
  running_total
  end

  def place_order
    account_sid = 'ACdaee16d1b80a58b5a9d8f10c08601e51'
    auth_token = '22a12a2d5a610b4dd5f5904daf349c91'

    @client = Twilio::REST::Client.new account_sid, auth_token

    order_time = Time.new + 1

    @client.account.messages.create({
      :from => '+441143032627',
      :to => '+447595549079',
      :body => "Your order will be with you at #{(Time.new+3600)}.",
      })
  end

end

require_relative './menu'
require_relative './order'
require 'time'
require 'twilio-ruby'

class Restaurant
  attr_reader :menu
  attr_reader :category_array
  attr_reader :bank_account

  INITIAL_CASH_AMOUNT = 100

  ERROR_MESSAGES = {
    category_does_not_exist: 'Sorry, the caregory you are trying to choose does not exist',
    dish_does_not_exist: 'Sorry, the dish you are trying to choose does not exist',
    invalid_dish_count: 'Sorry, dish count can be 1 or more'
  }.freeze

  def initialize(menu = Menu.new, bank_account = INITIAL_CASH_AMOUNT)
    @menu = menu
    @category_array = ['pizza', 'paste', 'side', 'salde']
    @bank_account = bank_account

    account_sid = 'AC51859c3bada076b7262f4f545121a302'
    auth_token = 'e8faccab6929c94b4171ee77b5f3250e'
    @client = Twilio::REST::Client.new account_sid, auth_token
  end

  def show_menu
    @menu.print_menue
  end

  def take_an_order
    order = create_an_order
    if verify_an_order(order)
      puts "Please pay your order"
      return order
    else
      puts "Thanks for visiting us!"
      return nil
    end
  end

  def receive_money(amount, customer)
    @bank_account += amount
    current_time = Time.now
    delivery_time = current_time + 3600
    message = "Thank you! Your order was placed and will be
    delivered before #{delivery_time.hour}:#{delivery_time.min}"
    @client.api.account.messages.create(
      from: '+447403941285',
      to: customer.telephone,
      body: message
    )
    # send
  end

  private

  def create_an_order
    new_order = Order.new
    while true do
      puts 'From which category do you want to choose?'
      category_chosen = gets.chomp.downcase
      raise ERROR_MESSAGES[:category_does_not_exist] unless @category_array.include?(category_chosen)
      puts 'Which dish do you want to choose?'
      dish_name = gets.chomp
      puts 'How many do you want?'
      dish_count = gets.chomp.to_i
      raise ERROR_MESSAGES[:invalid_dish_count] if dish_count <= 0
      dish = menu.@menu[:category].select { |n|
        n.name == dish_name
      }.first
      raise ERROR_MESSAGES[:dish_does_not_exist] if dish == nil
      new_order.add(DishOrder.new(dish, dish_count))
      puts 'Do you want to order anything else (yes/no)?'
      break if gets.chomp.downcase == 'yes'
    end
    return new_order
  end

  def verify_an_order(order)
    order.print_order
    puts "Please, confirm the order: (yes/no)"
    user_confirmation = gets.chomp.downcase
    return user_confirmation == 'yes'
  end
end

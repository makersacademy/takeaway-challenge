require_relative 'menu'
require 'twilio-ruby'

class Ordering

  attr_reader :selected_dishes, :menu_items

  def initialize(menu = Menu.new)
    @menu = menu
    @selected_dishes = {}
  end

  def selection(food, quantity = 1)
    fail "Sorry that item isn't on the menu! Please choose from the menu." unless @menu.menu_items.to_s.include?(food)
    item = 1
    quantity.times do
      @selected_dishes["#{item}.#{food}"] = @menu.menu_items[food.to_sym]
      item += 1
    end
  end

  def view_order
    p selected_dishes
    p"You have ordered #{selected_dishes.count} dishes."
  end

  def calculate_cost
    cost = @selected_dishes.map { |food, price| price }.sum.round(2)
    p "Total: £#{cost}"
  end

  def delivery_time
    t = Time.now + 1800
    t.strftime("%I:%M%p")
  end

  def final_order
  "Thank you! Your order was placed and will be delivered before #{delivery_time}.\n
  Your order: #{@selected_dishes} \n
  #{view_order} \n
  #{calculate_cost}"
  end

  def text_message
  account_sid = "AC7b8ed7836f0036285435eff3f062bb9a"
  auth_token = "c07c50d5ed0310975048dfae169cb41e"

  @client = Twilio::REST::Client.new account_sid, auth_token
  message = @client.messages.create(
    body: final_order,
    to: "+447914626864",    # Replace with your phone number
    from: "+441793250639")  # Replace with your Twilio number
    puts message.sid
  end
end

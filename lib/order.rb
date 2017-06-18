require_relative '../lib/menu.rb'
require 'date'
require 'twilio-ruby'

class Order < Menu
  attr_reader :basket, :updated_basket

  def initialize
    @basket = []
    @updated_basket = {}
  end

  def order_dish(quantity = 1, dish)
    menu_item = lookup_item(dish)
    puts quantity.to_s + ' ' + dish + '(s) added to your basket.'
    while quantity > 0
      @basket << menu_item
      quantity -= 1
    end

  end

  def lookup_item(dish)
    fail 'Please enter an item from the menu.' unless @@dishes.key?(dish)
    chosen_dish = @@dishes.select do |item, _price|
      item == dish
    end
    chosen_dish
  end

  def create_basket_items
    combine_items
    list = ''
    @updated_basket.each do |dish, quantity|
      dish.each do |name, price|
        list += "(" + quantity.to_s + ") " + name + "(s): £" + (price * quantity).to_s + "\n"
      end
    end
    list
  end

  def combine_items
    @basket.group_by(&:itself).each { |dish, quantity| @updated_basket[dish] = quantity.length }
  end

  def create_basket_total
    total = 0
    @basket.each { |dish| dish.each { |_name, price| total += price } }
    return total
  end

  def show_items
    list = create_basket_items
    puts list
  end

  def show_total
    total = create_basket_total
    puts 'Total to pay: £' + total.to_s
  end

  def show_basket
    show_items
    show_total
  end

  def place_order
    account_sid = "sid number goes here"
    auth_token = "sid token goes here"
    client = Twilio::REST::Client.new account_sid, auth_token

    date = (DateTime.now + 1.0 / 24).strftime("%H:%M")

    from = "+my Twilio number"

    myself = { "+my actual number" => "Miho" }

    myself.each do |key, value|
      client.account.messages.create(
        :from => from,
        :to => key,
        :body => "Thanks for your order, #{value}. It will be delivered at " + date.to_s + "."
      )
      puts "Sent message to customer: #{value}"
    end
  end
end

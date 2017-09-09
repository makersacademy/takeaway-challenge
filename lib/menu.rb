#understands dishes and prices
require 'twilio-ruby'
require_relative 'order'


class Menu
  attr_reader :menu_list, :order

  def initialize
    @account_sid = 'ACa5fda56002c61f9d86bdf5c4e041bb07'
    @auth_token = '5f9399041c30d07566c889c0be5ca262'
    puts """
    Welcome to the \"Pizza Place\"!
    Choose your order from below!

    Commands : menu.print             # See menu
    menu.choose \"dish\"   # Choose a dish(lowercase)
    """
    @menu_list = {"cheese and tomato" => 5.99,
      "chicken" => 6.99,
      "three cheeses" => 6.99,
      "pepperoni" => 7.99,
      "vegetarian" => 7.99,
      "pizza especial" => 8.99,
    }
    @order = Order.new
  end

  def print
    @menu_list.each do |dish, price|
      puts "#{dish.to_s.capitalize.ljust(20)} : £#{price}"
    end
  end

  def choose(dish)
    @order << @menu_list.select {|k,v| k == dish }
    puts "You have added #{@menu_list[dish]}"
  end

  def check
    @order.each_key do |k|
      puts "You have ordered #{k} £#{v}"
    end
    @order.each_value do |v|
      v.inject {|s,n|s+n}
    end
  end

  def notify
    @client = Twilio::REST::Client.new(@account_sid, @auth_token)
    @client.messages.create(
    from: '+441344567850',
    to: '+447585550267',
    body: 'Holy shit bro this is so cool! Hi Siobhan! Not meaning to be creepy or anything :)'
    )
  end
end

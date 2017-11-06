require './lib/menu.rb'
require 'twilio-ruby'
require './auth_credentials'

class TakeAway
  attr_reader :basket, :menu, :total

  def initialize(menu: Menu.new)
    @basket = []
    @menu = menu
    @total = 0
  end

  def read_menu
    @menu.read_menu
  end

  def add_to_basket(dessert)
    raise 'Please pick a dessert from the menu.' unless in_menu?(dessert)
    adding_to_total(dessert)
  end

  def remove_from_basket(dessert)
    @basket.each { |item| item.each { |name, price| @total -= price if name == dessert } }
    @basket.select { |item| item.each { |name, _| @basket.delete item if name == dessert } }
  end

  def empty_basket
    puts 'Your basket is now empty'
    @basket = []
    @total = 0
  end

  def finalize_order
    puts 'Your order has been noted and is now being processed. See you later!'
    send_text('Thank you for your order! Your order should arrive in less than an hour.')
  end

  def see_basket
    @basket.each { |item| item.each { |name, _|
      puts name
    } }
    puts "Your total is: £#{@total}"
    return "total: £#{@total.round(2)}"
  end

  def send_text(message)
    account_sid = ACCOUNT_SID
    auth_token = AUTH_TOKEN
    @client = Twilio::REST::Client.new account_sid, auth_token
    @client.messages.create({
    from: FROM,
    to: TO ,
    body: message })
  end

  private
  def in_menu?(dessert)
    !@menu.dishes.select { |dish| dish.include?(dessert) }.empty?
  end

  def adding_to_total(dessert)
    getting_amount
    item = @menu.dishes.select { |dish| dish.include?(dessert) }.pop
    @replacement = []
    @amount.to_i.times { @basket << item && @replacement << item }
    @replacement.each { |item| item.each { |_, price| @total += price } }
    response
  end

  def getting_amount
    puts 'How many of these would you like?'
    @amount = gets
  end

  def response
    int = @amount.to_i
    int == 1 ? response = 'Item was added to basket!' : response = 'Items were added to basket!'
    puts response
  end
end

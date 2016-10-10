require_relative 'menu'
require 'twilio-ruby'

class Order

  attr_reader :basket, :menu

  def initialize(menu = Menu.new)
    @menu = menu
    @basket = []
    @total = 0
    @confirmed = false
    time = (Time.now+(60*60))
    @confirmation_text = "Thank you! Your order was placed and will be delivered before #{time.strftime("%H")}:#{time.strftime("%M")}. You ordered:"
  end

  def add_item(item, quantity = 1)
    check_exists(item)
    @confirmation_text += " #{quantity} portion(s) of #{item},"
    retrieve_price(item)
    recalculate_total(quantity)
    basket << {item: item, quantity: quantity}
  end

  def total
    @total
  end

  def confirmed?
    @confirmed
  end

  def confirm
    confirm_and_text
  end

  private

  def check_exists(item)
    item_found = false
    @menu.list.each do |x|
      if x.name == item
        item_found = true
      end
    end
    fail "Item on not on the menu" unless item_found
  end

  def retrieve_price(item)
    item_to_find = @menu.list.select { |y| y.name == item }
    @item_cost = item_to_find[0].price
  end

  def recalculate_total(quantity)
    @total += @item_cost * quantity
    @item_cost = 0
  end

  def confirm_and_text
    account_sid = "AC9260c0d2e30d8e0ed7b71f2206744564"
    auth_token = "1a3ecd829703c63b70836734592ce643"
    @client = Twilio::REST::Client.new account_sid, auth_token
    text = "#{@confirmation_text} and the total comes to £#{@total}"
    message = @client.account.messages.create(:body => text,
        :to => "+447973628682",
        :from => "+441634540313")
    message.sid
    @confirmed = true
  end
end

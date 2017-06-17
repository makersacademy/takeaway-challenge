require_relative '../lib/menu.rb'

class Order < Menu
  attr_reader :basket, :updated_basket

  def initialize
    @basket = []
    @updated_basket = {}
  end

  def order_dish(quantity = 1, dish)
    menu_item = lookup_item(dish)
    while quantity > 0
      @basket << menu_item
      quantity -= 1
    end
  end

  def lookup_item(dish)
    @@dishes.select { |item, _price| item == dish }
  end

  def basket_items
    combine_items
    list = ''
    @updated_basket.each do |dish, quantity|
      dish.each do |name, price|
        list += "(" + quantity.to_s + ") " + name + "(s): £" + (price * quantity).to_s + "\n"
      end
    end
    return list
  end

  def combine_items
    @basket.group_by(&:itself).each { |dish, quantity| @updated_basket[dish] = quantity.length }
  end

  def basket_total
    total = 0
    @basket.each { |dish| dish.each { |_name, price| total += price } }
    return total
  end

  def show_items
    list = basket_items
    puts list
  end

  def show_total
    total = basket_total
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

    from = "+my Twilio number"

    myself = { "+my actual number" => "Miho" }

    myself.each do |key, value|
      client.account.messages.create(
        :from => from,
        :to => key,
        :body => "Thanks for your order, #{value}. It will be delivered in 1 hour."
      )
      puts "Sent message to customer: #{value}"
    end
  end
end

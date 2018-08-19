require 'twilio-ruby'

class Takeaway

  attr_reader :dishes, :order

  def initialize(dishes = { "Pepperoni" => 7.50, "Hawaiian" => 6.50, "vegetarian" => 5.50 })
    @dishes = dishes
    @order = {}
  end

  def view_menu
    dishes
  end

  def place_order
    account_id
    message
  end


  def add_to_order(dish, quantity)
    fail "#{dish} is not on the menu" unless dishes.has_key?(dish)
    order[dish] = quantity
  end

  def total
    order_totals.sum
  end

  private

  def order_totals
    order.map do |dish, quantity|
      dishes[dish] * quantity
    end
  end

  def account_id
    account_sid = "ACe16a4eddf4b5e19a3331831d7df88b9b"
    auth_token = "f6964d00315fe133190e213d9cc775f1"
    @client = Twilio::REST::Client.new(account_sid, auth_token)
  end

  def message
    @client.messages.create(
      from: +447480537261,
      to: +7968841830,
      body: "Thank you! Your order was placed and will be delivered before 18:52"
    )
  end

end

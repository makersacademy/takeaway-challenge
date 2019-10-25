require_relative 'menu'
require 'dotenv/load'
require 'httparty'

API_KEY = ENV['SLACK_WEBHOOK_URL']

class Takeaway
  def initialize(dishes = { "soup" => 0.9 })
    @menu = Menu.new
    dishes.each { |name, price| @menu.add_item(name, price) }
    @order = Hash.new(0)
  end

  def menu
    puts @menu
  end

  def order(dish, quantity = 1)
    @order[dish] += quantity
  end

  def order_summary
    "#{@order.map { |dish, quantity| "#{quantity}x #{dish}" }.join("\n")}
Total: ‽#{total_price}"
  end

  def checkout(price)
    raise "Incorrect total price" unless correct_total?(price)
    send_text("Order complete! Total: ‽#{total_price}
It will be delivered before #{(Time.now + (60 * 60)).strftime("%H:%M")}")
  end

  private

  def total_price
    @order.reduce(0) do |total, (dish, quantity)|
      total + quantity * @menu.price(dish)
    end
  end

  def correct_total?(price)
    price == total_price
  end

  def send_text(message)
    raise "Missing API key" unless API_KEY
    HTTParty.post(API_KEY, :body => {
      username: "Takeaway Challenge",
      icon_emoji: ":motor_scooter:",
      text: message,
      attachments: [
        {
          color: "#ffb600",
          title: "Your order",
          text: "```\n#{order_summary}\n```"
        },
        {
          color: "#007a5a",
          title: "Actions",
          actions: [
            {
              type: "button",
              text: "Contact us",
              url: "https://example.com",
              style: "primary"
            },
            {
              type: "button",
              text: "Cancel order",
              url: "https://example.com",
              style: "danger"
            }
          ]
        }
      ]
    }.to_json)
  end
end

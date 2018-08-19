require_relative "messager"

class Order
  attr_reader :o_items

  def initialize
    @o_items = []
  end

  def create_order_item(menu_item:, quantity:)
    @o_items << OrderItem.new(menu_item.number, menu_item.dish, menu_item.price, quantity)
  end

  def calculate_total
    total = 0
    @o_items.each do | o_item |
      total += o_item.price.to_f * o_item.quantity.to_i
    end
    "£#{sprintf("%0.2f", total)}"
  end

  def confirm
    Messager.send_text("Hey there, thanks for your order! Your food will be with you at #{(Time.now + 3600).strftime("%H:%M")}.")
  end
end

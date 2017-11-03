require './lib/text.rb'
require './lib/billing.rb'

class Takeaway

  attr_reader :order, :text, :billing

  def initialize(text = Text.new, billing = Billing.new )
    @menu = [
              {name: 'Burger', price: 4},
              {name: 'Chips', price: 2},
              {name: 'Chicken', price: 5}
            ]
    @order = []
    @text = text
    @billing = billing
  end

  def choose_item(chosen_food)
    choice = @menu.select { |x| x[:name].include?(chosen_food) }
    add_to_order(choice)
  end

  def add_to_order(item)
    @order << item
  end

  def calculate_total
    @billing.total(@order)
  end

  def finialize_order
    @text.send_text(calculate_total)
  end
end

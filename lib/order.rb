require './lib/takeaway'
require './lib/message'
require 'twilio-ruby'

class Order

  attr_reader :order

  def initialize
    @order = {}
  end

  def add(item)
    if @order[item] == nil
      @order[item] = 1
    else
      count = @order[item]
      @order[item] = count + 1
    end
    @order
  end

  def total_cost
    @cost_calculator = 0
    cost_calculator_hash = Hash[ @order.map {|key, value| [key, (value.to_f * Takeaway::MENU[key].to_f)]}]
    cost_calculator_hash.each do |key, value|
      @cost_calculator += value
    end
    "Total cost is £#{sprintf("%0.02f", @cost_calculator)}"
  end

  def confirm(message = Message.new)
    @message = message
  end

end

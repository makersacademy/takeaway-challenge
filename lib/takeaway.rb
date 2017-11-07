require './lib/text'
require './lib/billing'
require './lib/menu'

class Takeaway

  attr_reader :menu, :order, :order_history

  def initialize(text = Text, billing = Billing.new, menu = Menu.new)
    @menu = menu
    @order = [{ total: 0 }]
    @text = text
    @billing = billing
    @order_history = []
  end

  def parse_order(string)
    string.split(',').each do |x|
      amount, word = x.split(' ')
      choose(word, amount.to_i)
    end
  end

  def print_menu
    @menu.items
  end

  def check_sum
    @billing.check_sum(@order, @billing.sum(@order))
  end

  def confirm_order
    @text.new.send_text(@order[0][:total])
    @order_history << @order
    @order = [{ total: 0 }]
  end

  private

  def sum
    @billing.sum(@order)
  end

  def choose(query, quantity = 1)
    selection = @menu.menu.find { |x| x[:name].downcase.include?(query.downcase) }
    raise 'Please choose something from the menu' unless selection
    selection[:quantity] = quantity
    add_to_order(selection)
  end

  def add_to_order(item)
    @order << item
    @order[0][:total] = sum
  end

end

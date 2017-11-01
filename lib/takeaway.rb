require './lib/text'
require './lib/billing'

class Takeaway

  attr_reader :menu, :order

  def initialize(text = Text.new, billing = Billing.new)
    @menu = [
              {name: 'Bolognese', price: 6},
              {name: 'Pizza', price: 8},
              {name: 'Chips', price: 2},
              {name: 'Chicken', price: 3},
              {name: 'Hamburger', price: 4},
              {name: 'Donner Wrap', price: 6},
              {name: 'Nuggets', price: 3},
              {name: 'Mozzarella Sticks', price: 5},
              {name: 'Deep-fried Mars Bar', price: 1},
              {name: 'Fish', price: 5}
            ]

    @order = [{total: 0}]
    @text = text
    @billing = billing
  end

  def parse_order(string)
    string.split(',').each do |x|
      amount, word = x.split(' ')
      choose(word, amount.to_i)
    end
  end

  def confirm_order
    @text.send_text(@order[0][:total])
    @order = [{total: 0}]
  end

  private

  def sum
    @billing.sum(@order)
  end

  def choose(query, quantity = 1)
    selection = @menu.find{|x| x[:name].downcase.include?(query.downcase)}
    raise 'Please choose something from the menu' unless selection
    selection[:quantity] = quantity
    add_to_order(selection)
  end

  def add_to_order(item)
    @order << item
    @order[0][:total] = sum
  end

end
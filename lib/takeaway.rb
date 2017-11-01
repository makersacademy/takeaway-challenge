require './lib/text'

class Takeaway

  attr_reader :menu, :order

  def initialize(text = Text.new)
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
  end

  def choose(query, quantity = 1)
    selection = @menu.find{|x| x[:name].include?(query.capitalize)}
    raise 'Please choose something from the menu' unless selection
    selection[:quantity] = quantity
    @order << selection
    @order[0][:total] = sum
  end

  def sum
    total = 0
    @order.each do |x|
      if x.key?(:name)
        total = total + x[:price] * x[:quantity]
      end
    end
    total
  end

  def check_sum(sum = @order[0][:total])
    total = 0
    @order.each do |x|
      if x.key?(:name)
        total = total + x[:price] * x[:quantity]
      end
    end
    total
    raise "Sum is not correct!" unless sum == total
    true
  end

  def confirm_order
    @text.send_text(@order[0][:total])
    @order = [{total: 0}]
  end

end
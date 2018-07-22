require 'menu'

class Order
  attr_reader :whiskies

  def initialize(menu)
    @menu = menu
    @whiskies = {
      "thing1": 2,
      "thing2": 1
    }
  end

  def add(item, quantity)
    raise "Sorry, we don't offer #{item}!" unless whiskies.has_key?(item)
    whiskies[item] = quantity
  end

  private

  attr_reader :menu
end

# class WrongItemError < StandardError; end

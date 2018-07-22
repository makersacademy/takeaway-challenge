require 'menu'

class Order
  attr_reader :whiskies

  def initialize(menu)
    @whiskies = {}
    @menu = menu
  end

  def add(item, quantity)
    fail WrongItemError, "Sorry, we don't offer #{item.capitalize}" unless menu.has_item?(item)
    whiskies[item] = quantity
  end

  private

  attr_reader :menu
end

class WrongItemError < StandardError; end

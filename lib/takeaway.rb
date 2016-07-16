require_relative "menu"

class Takeaway

  attr_reader :basket, :menu, :total

  def initialize
    @basket = {}
    @menu = Menu.new.menu
  end

  def print_menu
    @menu
  end

  def order(item, quantity = 1)
    fail "Sorry, that item is not on the menu" unless check_menu(item.capitalize)
    @basket.store(item, quantity)
    confirm(item, quantity)
  end

  def total
    @total = 0
    @menu.each do |key, value|
      if @basket.has_key?(key)
        @total += (@basket[key] * value)
      end
    end
    @total
  end

  private

  def check_menu(item)
    @menu.has_key?(item)
  end

  def confirm(item, quantity)
    "#{quantity} #{item} has been added to your basket"
  end

end

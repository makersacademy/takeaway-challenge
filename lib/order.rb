require_relative 'menu'

class Order
  attr_reader :basket, :menu, :grand_total

  def initialize(menu = Menu.new)
    @basket = Hash.new(0)
    @menu = menu.menu
    @grand_total = 0
  end

  def add_to_basket(item, quantity = 1)
    fail "Item not on the menu" unless on_menu?(item)
    self.basket[item] = quantity if self.basket.include? item == false
    self.basket[item] += quantity
    add_to_total(total(item, quantity))
  end

  def checkout(total)
    fail "Incorrect total. Please double-check." unless correct_total?(total)
    true
  end

  private
  attr_writer :grand_total

  def on_menu?(item)
    self.menu.include?(item.to_sym)
  end

  def total(item, number = 1)
    self.menu[item.to_sym] * number
  end

  def add_to_total(amount)
    self.grand_total += amount
  end

  def correct_total?(amount)
    amount == self.grand_total
  end
end

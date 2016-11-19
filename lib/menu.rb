class Menu
  attr_reader :list, :basket, :grand_total
  def initialize
    @list = {
      bacon_sandwich: 4,
      scrambled_eggs: 5,
      poached_eggs: 4,
      toast: 1
    }
    @basket = Hash.new(0)
    @grand_total = 0
  end

  def add_to_basket(item, number = 1)
    fail "Item not on the menu" unless on_menu?(item)
    self.basket[item] = ["Quantity: #{number}, Total price: #{total(item, number)}"]
    add_to_total(total(item, number))
  end

  def checkout(total)
    fail "Incorrect total. Please double-check." unless correct_total?(total)
    true
  end

  private
  attr_writer :grand_total
  def on_menu?(item)
    self.list.include?(item.to_sym)
  end

  def total(item, number = 1)
    self.list[item.to_sym] * number
  end

  def add_to_total(amount)
    self.grand_total += amount
  end

  def correct_total?(amount)
    amount == self.grand_total
  end
end

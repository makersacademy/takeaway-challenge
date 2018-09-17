require './lib/menu'


class Order

  attr_reader :basket

  def initialize(menu = Menu.new)
    @menu = menu
    @basket = []

  end


  def add(item, amount)
    fail "Item unavailable" unless @menu.items.include?(item)
    amount.times {@basket << item}
  end

  def review
    current_basket = @basket.group_by(&:itself).map { |item, amount| "#{item} #{amount.size}" }.join(' ,')
    current_basket
  end

  def total
    final_balance = 0
    @basket.each do |cost|
      final_balance += @menu.items[cost]
    end
    final_balance
  end

  

end

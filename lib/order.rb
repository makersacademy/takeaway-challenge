class Order

  attr_reader :items, :menu

  def initialize(menu)
    @items = Hash.new(0)
    @menu = menu
  end

  def add(item, quantity)
    fail "#{item} not avaliable!" unless menu.include_item?(item)

    items[item] += quantity
  end

  def total
    item_totals.reduce(:+)
  end

  def item_totals
    items.map do |item, quantity|
      menu.price(item) * quantity
    end
  end
 
end

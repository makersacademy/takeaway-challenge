require_relative 'menu'

class Order

  attr_reader :basket, :menu

  def initialize(menu = Menu.new)
    @menu = menu
    @basket = []
    @total = 0
    @confirmed = false
  end

  def add_item(item, quantity = 1)
    check_exists(item)
    retrieve_price(item)
    basket << {item: item, quantity: quantity}
    recalculate_total(quantity)
  end

  def total
    @total
  end

  def confirmed?
    @confirmed
  end

  def confirm
    @confirmed = true
  end

  private

  def check_exists(item)
    item_found = false
    @menu.list.each do |x|
      if x.name == item
        item_found = true
      end
    end
    fail "Item on not on the menu" unless item_found
  end

  def retrieve_price(item)
    item_to_find = @menu.list.select { |y| y.name == item }
    @item_cost = item_to_find[0].price
  end

  def recalculate_total(quantity)
    @total += @item_cost * quantity
    @item_cost = 0
  end
end

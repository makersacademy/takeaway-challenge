require_relative 'menu'

class Dish

  DEFAULT_QUANTITY = 1
  attr_reader :details, :item

  def initialize(number, menu)
    @item = create_item(number, menu)
  end

  def get_details(number, menu)
    @details = menu.list.detect{ |dish|
      dish[:number] == number }
  end

  private

  def create_item(number, menu)
    get_details(number, menu)
    item = {}
    item[:name] = details[:name]
    item[:price] = details[:price].to_f.round(2)
    item[:quantity] = DEFAULT_QUANTITY
    item
  end
end

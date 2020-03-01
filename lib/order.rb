class Order

  attr_reader :dishes

  def initialize(menu)
    @dishes = {}
    @menu = menu
  end

  def add(dish, quantity)
    fail NoItemError, "#{dish.capitalize} is not on the menu!" unless menu.has_dish?(dish)

    dishes[dish] = quantity
  end

  def total
    # .inject method allows us to pass a symbol and it will call that
    # method on all the values in the array
    item_totals.inject(:+)
  end

  private

  attr_reader :menu

  def item_totals
    # .map method goes through each element in the hash and changes it
    # from a key value into whatever we decide to return from this block
    dishes.map do |dish, quantity|
      menu.price(dish) * quantity
    end
  end
end

# extend from standard error (common practice)
class NoItemError < StandardError; end

class Order
  attr_reader :cart
  INVALID_INDEX = 'selection not valid'

  def initialize(menu)
    @menu = menu
    @cart = []
  end

  def add_to_cart(index)
    raise INVALID_INDEX unless valid_index?(index)

    @cart << @menu.give_list[index - 1]
  end

  private

  def valid_index?(index)
    index.is_a?(Integer) && index <= @menu.give_list.length && index.positive?
  end
end

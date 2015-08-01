class Order

  attr_reader :menu

  def initialize
    @order = {}
  end

  def choose_dish dish
    fail "This item is not availble on the menu" unless @menu.has_key?(dish)
  end

end
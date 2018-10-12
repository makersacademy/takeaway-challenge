class Order

  def initialize(menu)
    @menu = menu
  end

  def choose(items)
    items.each do |item|
      fail_message unless @menu.any? { |list| list[item] }
    end
  end

  private

  def fail_message
    fail "This item is not on the menu: choose something else"
  end
end

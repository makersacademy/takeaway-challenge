class Order

  def initialize(menu)
    @menu = menu
  end

  def choose(items)
    items.each do |item|
      if @menu.any? {|list|list[item] }
        item
      else
        fail "This item is not on the menu: please choose something else"
      end
    end
  end
end

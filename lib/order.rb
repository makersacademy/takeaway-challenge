class Order

  def initialize(menu_items)
    @menu = menu_items
    @items = []
    @total = 0
  end

  def choose(item)
    fail_message unless @menu.any? { |list| list[item] }
    @items << item
  end

  def confirm_order
    total
    "You have ordered: #{@items.join(" and ")}. Total due: £#{@total}"
  end

  private

  def fail_message
    fail "This item is not on the menu: choose something else"
  end

  def total
    @items.each do |pizza|
      @menu.each do |menu_item|
        @total += menu_item[pizza] unless menu_item[pizza].nil?
      end
    end
    @total
  end
end

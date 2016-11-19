class Order

  attr_reader :selection, :shopping_cart, :menu

  def initialize
    @selection = {}
    @shopping_cart = []
    @menu = Menu.new
  end

  def select_items(item, quantity)
    @selection = { item.to_sym => quantity }
    add_selection_to_order
  end

  def add_selection_to_order
    @shopping_cart << @selection
  end

  def get_price
    @shopping_cart.each do |food_item|
      food_item.each do |item, quantity|
        @price = menu.menu_items[item]
        p "#{quantity} x #{item.to_s} at £#{@price} = £#{@price * quantity}"
      end
    end
  end



end

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

  # def review_order
  #  "Your selection is: "
  #   shopping_cart.each do |number, quantity|
  #    number = @menu.menu_items[number]
  #    "#{quantity} x #{@menu.menu_items[name].to_s} = £#{@menu.menu_items[price].to_s} per dish"
  #  end
  #
  #  def iterate_over_order
  #    @menu.menu_items
  #  end
 # end



end

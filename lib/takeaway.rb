class Takeaway

  attr_reader :menu, :order

  def initialize
    @menu = {"starter" => 5, "mains" => 10, "desert" => 3}
  end

  def show_dishes
    print "starter : 5\nmains : 10\ndesert : 3\n"
  end

  def order(*dishes)
    dishes.pop
    @order = convert_order_to_hash(dishes)
    check_all_dishes_are_on_menu
  end

  def convert_order_to_hash(dishes)
    Hash[*dishes]
  end

  def check_all_dishes_are_on_menu
    @order.each do |dish, quantity|
      fail "Unable to place order: dish not on menu" unless @menu.has_key?(dish)
    end
  end
end

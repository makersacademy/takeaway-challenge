class Takeaway

  attr_reader :menu, :order_as_hash, :customer_supplied_total, :actual_total

  def initialize
    @menu = {"starter" => 5, "mains" => 10, "desert" => 3}
  end

  def show_dishes
    print "starter : 5\nmains : 10\ndesert : 3\n"
  end

  def order(*dishes)
    @customer_supplied_total = dishes.pop
    convert_order_to_hash(dishes)
    check_all_dishes_are_on_menu
    check_customer_and_actual_totals_match
  end

private

  def check_customer_and_actual_totals_match
    calculate_order_total
    fail "Unable to place order: supplied total doesn't match actual total" if totals_dont_match?

  end

  def totals_dont_match?
    actual_total != customer_supplied_total
  end

  def calculate_order_total
    @actual_total = 0
    order_as_hash.each {|k, v| @actual_total += menu[k] * v}
  end

  def convert_order_to_hash(dishes)
    @order_as_hash = Hash[*dishes]
  end

  def check_all_dishes_are_on_menu
    order_as_hash.each do |dish, quantity|
      fail "Unable to place order: dish not on menu" unless @menu.has_key?(dish)
    end
  end
end

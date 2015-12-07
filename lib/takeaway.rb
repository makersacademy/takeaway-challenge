
require_relative 'text.rb'

class Takeaway

  attr_reader :menu, :order_as_hash, :customer_supplied_total, :actual_total,
  :text

  def initialize(text_klass = Text.new)
    @menu = {"starter" => 5, "mains" => 10, "desert" => 3}
    @text = text_klass
  end

  def show_dishes
    print "starter : 5\nmains : 10\ndesert : 3\n"
  end

  def order(*dishes)
    @customer_supplied_total = dishes.pop
    convert_order_to_hash(dishes)
    check_all_dishes_are_on_menu
    check_customer_and_actual_totals_match
    text_confirmation(text)
  end



  private

  def text_confirmation(text)
    text.send
  end

  def check_customer_and_actual_totals_match
    calculate_order_total
    message = "Unable to place order: supplied total doesn't match actual total"
    fail message  if totals_dont_match?
  end

  def totals_dont_match?
    actual_total != customer_supplied_total
  end

  def calculate_order_total
    @actual_total = 0
    order_as_hash.each {|dish, quantity| @actual_total += menu[dish] * quantity}
  end

  def convert_order_to_hash(dishes)
    @order_as_hash = Hash[*dishes]
  end

  def check_all_dishes_are_on_menu
    order_as_hash.each do |dish, quantity|
      fail "Unable to place order: dish not on menu" unless @menu.key?(dish)
    end
  end
end

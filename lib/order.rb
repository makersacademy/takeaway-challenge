class Order

  attr_reader :order_as_hash, :menu, :actual_total, :customer_supplied_total, :text

  def initialize(menu = Menu.new, text = Text.new)
    @menu = menu
    @text = text
  end

  def place_order(dishes)
    get_customer_total(dishes)
    check_order(dishes)
    text_confirmation(text)
  end

  def check_order (dishes)
    convert_order_to_hash(dishes)
    check_all_dishes_are_on_menu
    check_customer_and_actual_totals_match
  end

  private

  def convert_order_to_hash(dishes)
    @order_as_hash = Hash[*dishes]
  end

  def check_all_dishes_are_on_menu
     menu.check_all_dishes_are_on_menu(order_as_hash)
  end

  def check_customer_and_actual_totals_match
    calculate_order_total
    message = "Unable to place order: total doesn't match actual total"
    fail message  if totals_dont_match?
  end

  def calculate_order_total
    @actual_total = menu.calculate_order_total(order_as_hash)
  end

  def totals_dont_match?
    actual_total != customer_supplied_total
  end

  def get_customer_total(dishes)
    @customer_supplied_total = dishes.pop
  end

  def text_confirmation(text)
    text.send
  end
end

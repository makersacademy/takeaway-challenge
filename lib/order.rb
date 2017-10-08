require_relative 'ordered_dish'

class Order
  attr_reader :selected_dishes
  def initialize send_sms_class = SendSms
    @selected_dishes = []
    @send_sms = send_sms_class.new
  end

  def select dish_name, quantity, dishes
    matches = dishes.select { |dish| dish_name == dish.name }
    no_matches_msg = 'Sorry, that is not available'
    matches.length > 0 ? process_order(matches, quantity) : no_matches_msg
  end

  def check customer_total
    raise "Sorry, our sums do not match" if customer_total != calculate_total
    @send_sms.send
    show_order
  end

  private

  def process_order matches, quantity
    matches.each { |match| make_selection match, quantity }
  end

  def make_selection match, quantity
    match.quantity_ordered += quantity
    selected_dishes << OrderedDish.new(match.name, match.price_per_unit, match.quantity_ordered)
  end

  def calculate_total
    selected_dishes.map { |dish| dish.quantity_ordered * dish.price_per_unit }.sum
  end

  def show_order
    result = selected_dishes.map(&:readable).join("\n")
    name = "Total"
    result += "\n-----------------\n"
    result += "#{'%-30s' % (name + ":")} £#{'%5.2f' % calculate_total}"
    result
  end

end

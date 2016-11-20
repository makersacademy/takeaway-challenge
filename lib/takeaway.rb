require_relative 'text_message'

class TakeAway

  attr_reader :new_order

  def initialize
    @new_order = []
  end

  def view_menu
  {"chicken carbonara" => 10,
        "tandoori chicken" => 12,
        "peri peri chicken" => 12,
        "garlic prawn" => 14,
        "pepperoni" => 12,
        "cheese" => 5}
  end

  def order(selected_dish)
    fail "Selection not available" if view_menu[selected_dish] == nil
    @new_order << selected_dish

  end

  def check_total
    @new_order.map {|dish| view_menu[dish]}.inject {|sum,n| sum + n}
  end

  def confirm_order(confirm)
    @new_order
    textmessage.send_confirmation_text
  end

end

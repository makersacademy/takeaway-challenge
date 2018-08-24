require_relative 'send_text'

class OrderChecker

  def initialize(menu, send_text = SendText.new)
    @menu = menu
    @send_text = send_text
  end

  def check_order(order)
    validate_order(order[0])
    validate_total(order)
    @send_text.send
  end

  private

  def validate_order(order)
    order.each_key { |order_index|
      raise "Invalid dish selection!" if order_index > @menu.length
    }
  end

  def validate_total(order)
    given_total = order[1]
    calculated_total = calculate_total(order[0])
    compare_totals(given_total, calculated_total)
  end

  def calculate_total(order)
    total = 0
    order.each do |index, quantity|
      total += @menu[index][:price] * quantity
    end
    total
  end

  def compare_totals(given_total, calculated_total)
    message = "Incorrect order total provided!"
    raise message unless calculated_total == given_total
    p "Total cost = £#{given_total}"
  end
end

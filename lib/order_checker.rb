require_relative 'send_text'

class OrderChecker

  def initialize(menu, order_array, send_text = SendText.new)
    @menu = menu
    @order_array = order_array
    @send_text = send_text
  end

  def check_order
    check_if_valid
    check_if_correct_total
    @send_text.send
  end

  private

  def check_if_valid
    raise "Invalid dish selection!" unless valid_order?
  end

  def valid_order?
    @order_array[0].each { |i| return false if i[0] >= (@menu.length + 1) }
    true
  end

  def check_if_correct_total
    given_total = @order_array[1]
    compare_totals(given_total, calculate_total)
  end

  def calculate_total
    total = 0
    @order_array[0].each do |order|
      total += @menu[order[0] - 1][:price] * order[1]
    end
    total
  end

  def compare_totals(given_total, calculated_total)
    message = "Incorrect order total provided!"
    raise message unless calculated_total == given_total
    p "Total cost = £#{given_total}"
  end
end

require_relative 'menu'

class Order

  def initialize(menu: , notify: Notify.new)
    @summary = {}
    @menu = menu
    @notify = notify
  end

  def add item
    dish = @menu.dishes[item]
    @summary[dish].nil? ? @summary[dish] = 1 : @summary[dish] += 1
  end

  def summary
    generate_summary
  end

  def from_menu
    @menu.display
  end

  def submit(order=@summary, paid=due)
    raise discrepency_message unless correct_total?(order, paid)
    message = "Thank you! Your order was placed and will be delivered before #{next_hour}"
    @notify.text message
  end

  private

  def correct_total?(order, paid)
    due(order) == paid
  end

  def discrepency_message
    "There is a discrepency with your order!"
  end

  def due(order=@summary)
    due = 0
    order.each { |key, value| due += key.price * value }
    due
  end

  def next_hour
    "#{(Time.now + 3600).hour}:#{Time.now.min}"
  end

  def generate_summary
    summary_display = "---\n"
    @summary.each do |key, value|
      summary_display += "Quantity: #{value}\nName: #{key.name}\n"
      summary_display += "Price: #{key.price}\n---\n"
    end
    summary_display += "===\nTotal: #{due}\n===\n"
  end
end

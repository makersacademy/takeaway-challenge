require_relative 'menu'

class Order

  def initialize(menu: )
    @summary = {}
    @menu = menu
  end

  def add item
    dish = @menu.dishes[item]
    @summary[dish].nil? ? @summary[dish] = 1 : @summary[dish] += 1
  end

  def summary
    summary_display = "---\n"
    @summary.each do |key, value|
      summary_display += "Quantity: #{value}\nName: #{key.name}\n"
      summary_display += "Price: #{key.price}\n---\n"
    end
    summary_display += "===\nTotal: #{total}\n===\n"
  end

  def from_menu
    @menu.display
  end

  def submit
  end

  def confirmed?
  end

  private

  def total
    @total = 0
    @summary.each do |key, value|
      @total += key.price * value
    end
    @total
  end
end

require_relative 'menu'

class Order

  def initialize(menu: )
    @summary = {}
    @menu = menu
  end

  def add item
    @summary[@menu.dishes[item]].nil? ? @summary[@menu.dishes[item]] = 1 : @summary[@menu.dishes[item]] += 1
  end

  def summary
    summary_display = "---\n"
    @summary.each do |key, value|
      summary_display += "Quantity: #{value}\nName: #{key.name}\nPrice: #{key.price}\n---\n"
    end
    summary_display += "===\nTotal: #{total}\n===\n"
  end

  def from_menu
    @menu.display
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

class Restaurant
  attr_reader :menu
  def initialize(menu = nil)
    @menu = menu || default_menu
  end

  def default_menu
    { flame_grilled_pheonix: 1200,
      sautéed_pineapple: 300,
      pickled_strawberry: 400 }
  end

  def list
    menu.inject("") do |list, (dish, price)|
      price = format '%.2f', price / 100.0
      list << "#{dish}: £#{price}\n"
    end
  end

  def add(items)
    menu.merge!(items)
  end

  def place(items, sum)
    fail unless sum == total(items)
    "Thanks for your order, it should arrive before #{time}."
  end

  def time
    (Time.now + 60 * 60).strftime('%H:%M')
  end

  def total(items)
    cost = items.inject(0) do |total, (dish, qty)|
      total + qty * menu[dish]
    end
    format '%.2f', cost / 100
  end
end

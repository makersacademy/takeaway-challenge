class Order
  attr_reader :summary, :menu

  def initialize(menu)
    @summary = Hash.new(0)
    @menu = menu
  end

  def add(dish, quantity)
    message = 'That dish is not on the menu. Please choose another one!'
    fail message unless menu.on_menu?(dish)
    order = { name: dish.name, price: dish.price }
    @summary[order] += quantity
  end

  def place_order
    arr = @summary.map do |k, v|
      "#{k[:name].capitalize}: £#{"%.2f" % k[:price]} x #{v}"
    end
    arr.join("\n")
  end

  def total
    sum = 0
    @summary.map { |k, v| sum += k[:price] * v }
    "£#{"%.2f" % sum}"
  end

  def check_order
    place_order + "\nTotal: #{total}"
  end
end

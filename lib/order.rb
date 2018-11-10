class Order

  DEFAULT_TOTAL = 0

  attr_reader :basket, :menu, :total, :quantities

  def initialize(menu)
    @menu = menu
    @basket = []
    @total = DEFAULT_TOTAL
    @quantities = Hash.new(0)
  end

  def add(item)
    @menu.list.each do |dish, price|
      @basket << [dish, price] if item == dish
    end
  end

  def get_total
    @basket.each {|dish, price| @total += price }
    @total
  end

  def get_quantities
    @basket.each do |item, price|
      @quantities[item] += 1
    end
    @quantities
  end

  def show_bill
    @quantities.each do |item, quantity|
      "#{item}, #{quantity}"
    end
    "total: #{get_total}"
  end

end

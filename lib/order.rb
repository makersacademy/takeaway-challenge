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

  def show_bill
    get_quantities
    format_bill
  end

  def empty_basket
    @basket.clear
    empty_quantities
    @total = 0
  end

  private

  def get_quantities
    @basket.each { |item, price|  @quantities[item] += 1 }
    @quantities
  end

  def format_bill
    (@quantities.to_a << ["total:", get_total]).join(' ')
  end

  def empty_quantities
    @quantities.clear
  end

end

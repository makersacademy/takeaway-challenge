class Order

  DEFAULT_TOTAL = 0

  attr_reader :basket, :menu, :quantities, :total

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

  def show_bill
    @total = get_total
    get_quantities
    format_bill
  end

  def confirm
    raise 'Total incorrect!' if order_not_verified?
    "Order confirmed!"
  end

  def empty_basket
    @total = DEFAULT_TOTAL
    @basket.clear
    empty_quantities
  end

  private

  def get_quantities
    @basket.each { |item, price|  @quantities[item] += 1 }
    @quantities
  end

  def get_total
    @basket.map { |item, price| price }.sum
  end

  def format_bill
    (@quantities.to_a << ["total:", @total]).join(' ')
  end

  def empty_quantities
    @quantities.clear
  end

  def order_not_verified?
    @total != @basket.map { |item, price| price }.sum
  end

end

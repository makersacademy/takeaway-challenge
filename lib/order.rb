class Order

  DEFAULT_TOTAL = 0

  attr_reader :basket, :menu, :quantities, :total, :selection

  def initialize(basket)
    @basket = basket
    @total = DEFAULT_TOTAL
  end

  def show_order
    @total = get_total
    get_quantities
    pretty_bill
  end

  def confirm
    raise 'Total incorrect!' if order_not_verified?
    "Order confirmed!" # call twilio
  end

  def empty_basket
    @total = DEFAULT_TOTAL
    @basket.clear
    empty_quantities
  end

  private

  def get_quantities
    @quantities = Hash.new(0)
    @basket.each { |item, price|  @quantities[item] += 1 }
  end

  def get_total
    @basket.map { |item, price| price }.sum
  end

  def pretty_bill
    (@quantities.to_a << ["total:", @total]).join(' ')
  end

  def empty_quantities
    @quantities.clear
  end

  def order_not_verified?
    @total != @basket.map { |item, price| price }.sum
  end

end

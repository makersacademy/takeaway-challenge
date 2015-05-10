class Restaurant

  attr_accessor :menu
  attr_reader :dishes
  attr_reader :choice
  attr_reader :order
  attr_reader :order_total

  def initialize(menu)
    @menu = menu.dishes
  end

  def receive_order(dishes)
    @dishes = dishes
    @dishes
  end

  def calculate_order(amount)
    @order = []
    if amount.length == 1
      num = amount[0].to_i
      @dishes.each { |dish| num.times { @order << dish } }
    else
      amounts = Hash[@dishes.zip(amount)]
      amounts.each { |dish, number| number.times { @order << dish } }
    end
    @order
  end

  def order_review
    @order_total = []
    @order.each do |dish|
      menu.select { |k, v| @order_total << [k, v] if k == dish }
    end
    price = calculate_total(@order_total)
    @order_total << ["Grand Total", price]
  end

  def calculate_total(*)
    prices = @order_total.flatten.select { |x| x.is_a? Float }
    @total_price = prices.inject(0) { |total, price| total + price }
    @total_price
  end
end
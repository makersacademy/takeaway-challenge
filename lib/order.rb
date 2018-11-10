class Order

  DEFAULT_TOTAL = 0

  attr_reader :basket, :menu, :total

  def initialize(menu)
    @menu = menu
    @basket = []
    @total = DEFAULT_TOTAL
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
    @basket << ["Total: ", @total]
  end


end

class TakeAway

  attr_reader :menu, :basket

  def initialize(menu = Menu.new)
    @menu = menu
    @basket = Hash.new(0)
  end

  def read_menu
    @menu.list
  end

  def order(dish, quantity = 1)
    if @menu.list.include?(dish)
      @basket[dish] += quantity
    end
    message(dish, quantity)
  end

  def basket_summary
    summary = []
    @basket.each do |item, amount|
      summary.push("#{item} x#{amount} = £#{amount * @menu.list[item]}")
    end
    summary.join(", ")
  end

  def total
    total = []
    @basket.each do |item, amount|
      total << amount * @menu.list[item]
    end
    "Total: £#{(total.sum).round(2)}"
  end


  private
  def message(dish, quantity)
    if @menu.list.include?(dish)
      "#{quantity}x #{dish}(s) added to your basket"
    end
  end


end

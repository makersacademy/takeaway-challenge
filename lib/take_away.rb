class TakeAway

  attr_reader :menu, :basket

  def initialize(menu = Menu.new)
    @menu = menu
    @basket = Hash.new(0)
    @total = 0.0
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
    @basket.each do |item, amount|
      @total += (amount * @menu.list[item])
    end
    "Total: £#{@total.round(2)}"
  end

  def checkout(price)
    fail "Check your total as it is incorrect" unless price == @total
    "Thank you! Your order was placed and will be delivered before #{(Time.new + 3600).strftime("%H:%M")}"
  end


  private
  def message(dish, quantity)
    if @menu.list.include?(dish)
      "#{quantity}x #{dish}(s) added to your basket"
    end
  end

end

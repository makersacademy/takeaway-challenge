class Takeaway

  attr_reader :menu, :basket

  def initialize
    @menu = Menu.new
    @basket = {}
  end

  def show_menu
    @menu
  end

  def add(item, number)
    if @basket.include?(item)
      @basket[item] = @basket[item] + number
    else
      @basket[item] = number
    end
    puts "#{number}x #{item} added to your basket."
  end

  def basket_summary
    summary = []
    @basket.each do |item, number|
      summary.push("#{number} #{item} = £#{@menu.menu[item] * number}")
    end
    return summary.join(", ")
  end

  def total
    total = 0.00
    @basket.each do |item, number|
      total += (@menu.menu[item] * number)
    end
    return "£#{total}"
  end

  def checkout
    puts @basket

  end

end

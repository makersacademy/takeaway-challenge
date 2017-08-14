class Order

  attr_reader :order

  def initialize
    @order = Hash.new { 0 }
    @summary = []
  end

  def add(item, n)
    @order[item] += n
  end

  def summary(menu)
    @order.keys.map do |item|
      { :item => item, :quant => @order[item], :total => menu.lookup(item) * @order[item] }
    end
  end

  def total(menu)
    total = 0
    summary(menu).each do |hash|
      total += hash[:total]
    end
    total
  end

end

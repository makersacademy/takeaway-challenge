class Order
  attr_reader :order, :total

  def initialize()
    @order = []
    @total = 0
  end

  def add_to_order(name, qty, price)
    if in_basket?(name)
      increase_qty_in_basket(name, qty.to_i)
    else
      @order << { name: name, qty: qty.to_i, price: price }
    end
    update_total
  end

  def remove_from_order(name, qty)
    @order.each do |item|
      item[:qty] -= qty if item[:name] == name
    end
    clean_order
    update_total
  end


  private
  def in_basket?(name)
    @order.each do |item|
      if item[:name] == name
        return true
      end
    end
    return false
  end

  def increase_qty_in_basket(name, qty)
    @order.each do |item|
      item[:qty] += qty if item[:name] == name
    end
  end

  def clean_order
    @order.each do |item|
      @order.delete(item) if item[:qty] <= 0
    end
  end

  def update_total
    total = 0
    @order.each do |item|
      total += item[:qty] * item[:price]
    end
    @total = total
  end

end

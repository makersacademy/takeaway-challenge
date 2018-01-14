class Order

  def initialize(menu, basket = {})
    @basket = basket
    @menu = menu
  end

  def add(item, qty)
    if @basket.has_key? item
      @basket[item] += qty
    else
      @basket.store(item, qty)
    end
  end

  def to_s
    string = ""
    @basket.each {|item, qty| string << "#{qty} x #{item}  = £%.2f %#{@menu.price(item) * qty}\n"}
    string
  end

  def total
    total = 0
    @basket.each{ |item, qty| total += (@menu.price(item) * qty) }
    total
  end

  def basket
    @basket.dup
  end

end
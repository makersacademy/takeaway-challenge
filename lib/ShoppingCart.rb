class ShoppingCart
  def initialize
    @open = true
    @items = {} # has form {"name" => {number: , price: }} where price is per item
    @total = 0.00
  end

  def open?
    @open
  end

  def add_to_order item
    if @items[item[:name]] == nil
      @items[item[:name]] = {number: 1, price: item[:price]}
    else
      @items[item[:name]][:number] += 1
    end
    @total += item[:price]
  end

  def show_cart
    #return "cart is empty" if @items.size == 0
    cart = ""
    puts @items.keys.size
    @items.keys.each do |key|
      value = @items[key]
      num = value[:number]; price = value[:price]
      cart += "#{num}x #{key}, £%0.2f\n" % (num.to_f * price)
    end
    cart + "Total: £%0.2f" % total()
  end

  def total
    @total.dup
  end

  def invoice
    @open = false
    {Total: total()}.merge(@items)
  end
end
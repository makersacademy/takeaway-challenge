class Order

  attr_reader :customer, :order, :total, :number

  def initialize(customer, number)
    @customer = customer
    @number = number
    @order = {}
    @total = 0
    @status = false
  end

  def add(item, quantity)
    if @order.include?(item)
      current_quantity = @order[item]
      current_quantity += quantity
      @order[item] = current_quantity
    else
      @order[item] = quantity
    end
  end

  def calc_total(menu)
    price = 0
    @order.each do |item, quantity|
      if quantity.class != Integer
         @total = 0
         @order = {}
         return "Error quantity not number"
       end
      @total += menu[item.to_sym] * quantity
    end
    "The order comes to £#{@total}"
  end

  def complete?
    @status = true if @total > 0
  end

end

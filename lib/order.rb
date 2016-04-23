class Order
  attr_reader :basket, :menu, :customer_price, :bill

  def initialize(menu = Menu.new)
    @menu = menu
    @basket = Hash.new(0)
  end

  def add(*args)
    dish, quantity, customer_total = args
    return "dish not found" unless menu.contains?(dish)
    quantity ||= 1
    add_to_basket( dish, quantity )
    checkout(customer_total) if customer_total
    acknowledge_order( dish, quantity, customer_total )

  end

  def checkout(amount)
    fail "nothing on basket" if basket.empty?
    @customer_price = amount
  end

  def basket_summary
   return "basket is empty" if basket.empty?
   summary = ""
   basket.each { |item, qty| summary += "#{item} x #{qty} = €#{qty*menu.dishes[item]}, " }
   summary
  end

  def total
    @bill = @basket.reduce(0) { |sum, (item, qty)| sum += qty*menu.dishes[item]}
    "Total: #{bill.round(2)}€"
  end

  private

    def add_to_basket( item, quantity )
      basket[item.to_sym] += quantity
    end

    def acknowledge_order( dish, quantity, customer_total )
      message = "#{quantity} x #{dish} added to your basket."
    end
end
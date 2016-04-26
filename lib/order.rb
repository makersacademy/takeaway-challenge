class Order
  attr_reader :basket, :menu, :takeaway, :customer_price, :bill

  def initialize(takeaway, menu = Menu.new)
    @menu = menu
    @takeaway = takeaway
    @basket = Hash.new(0)
  end

  def add(*args)
    dish, quantity, customer_total = args
    return "dish not found" unless menu.contains?(dish)
    quantity ||= 1
    add_to_basket( dish, quantity )
    output = checkout(customer_total) if customer_total
    acknowledge_order( dish, quantity, output )


  end

  def basket_summary
   return "basket is empty" if basket.empty?
   summary = ""
   basket.each { |i, q| summary += "#{i} x #{q} = €#{q*menu.dishes[i]}, " }
   summary
  end

  def total
    @bill = @basket.reduce(0) { |sum, (item, qty)| sum += qty*menu.dishes[item]}
    "Total: #{bill.round(2)}€"
  end

  def checkout(customer_price)
    fail "nothing on basket" if basket.empty?
    total   # required for quick orders, if not bill == nil
    output = takeaway.complete_order(bill.round(2), customer_price)
    clean_up
    output
  end

  def clean_up
    @basket.clear
    @bill = 0
    @customer_price = 0
  end

  private

    def add_to_basket( item, quantity )
      basket[item.to_sym] += quantity
    end

    def acknowledge_order( dish, quantity, ack_checkout)
      message = "#{quantity} x #{dish} added to your basket."
      msg_checkout = " Thank you! Your order has been processed. SMS sent."
      ack_checkout ? message + msg_checkout : message
    end
end
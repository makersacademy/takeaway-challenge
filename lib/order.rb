class Order
  attr_reader :basket, :menu, :ready_to_process

  def initialize(menu = Menu.new)
    @menu = menu
    @basket = Hash.new(0)
    @ready_to_process = false
  end

  def add(*args)
    dish, quantity, customer_total = args
    return "dish not found" unless menu.contains?(dish)
    quantity ||= 1
    add_to_basket( dish, quantity )
    confirm_order( dish, quantity, customer_total )
  end

  def checkout
    fail "nothing on basket" if basket.empty?
    @ready_to_process = true
  end

  def complete?
    @ready_to_process
  end

  def basket_summary
   return "basket is empty" if basket.empty?
   summary = ""
   basket.each { |item, qty| summary += "#{item} x #{qty} = €#{qty*menu.dishes[item]}, " }
   summary
  end

  private

    def add_to_basket( dish, quantity )
      basket[dish.to_sym] += quantity
    end

    def confirm_order( dish, quantity, customer_total )
      message = "#{quantity} x #{dish} added to your basket."
    end


end
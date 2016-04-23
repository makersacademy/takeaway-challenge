class Order
  attr_reader :basket, :menu, :person

  def initialize(menu = Menu.new, person = Person.new)
    @menu = menu
    @person = person
    @basket = Hash.new(0)
  end

  def add(*args)
    dish, quantity, customer_total = args
    add_to_basket( dish, quantity )
    confirm_order( dish, quantity, customer_total )
  end

  private

    def add_to_basket( dish, quantity )
      quantity ||= 1
      basket[dish.to_sym] += quantity
    end

    def confirm_order( dish, quantity, customer_total )
      raise "dish not found" unless menu.contains?(dish)
      quantity ||= 1
      message = "#{quantity} x #{dish} added to your basket."
      message += "Validating your order......." if customer_total
      message
    end


end
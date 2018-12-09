class Order

require_relative 'menu'

attr_reader :cart

  def initialize(takeaway)
    @cart = []
    @takeaway = takeaway
    @menu = takeaway.menu.menu #identified code smell would be refactored
  end

  def add(choice)
    @cart << @menu.select { |item, price| item == choice  }
  end

  def total
    count = 0
    @cart.each do |hash|
      hash.each do |item, price|
        count += price
      end
    end
    count
  end

  def summary
    receipt_string = ""
    @cart.each do |choice|
      choice.each do |item, price|
        receipt_string << "#{item} . . . . . £#{price} \n"
      end
    end
    receipt_string
  end


  def receipt
     summary <<  "The total for your order is: £#{total}"
  end

  def order_complete
    #this method will send the text confirming
  end
end

class Takeaway
  
  attr_reader :menu
  attr_accessor :items

  def initialize
    @menu = [ { dish: "pasta", price: 4},
              { dish: "pizza", price: 5},
              { dish: "salad", price: 3},
              { dish: "tiramisu", price: 3},
              { dish: "steak", price: 7},
              { dish: "tuna", price: 6} ]
    @order = []
    @items = 0
  end

  def begin_order(total)
    @items = total
  end

  def select(choice, quantity)
    selection = menu.select { |item| item[:dish].include?(choice) }[0]
    quantity.times { @order.push(selection) }
  end

  def send
    system("ruby send_sms.rb")
  end

  def place_order
    fail "incorrect number of dishes" if items != order.length
    send
    "Thank you! Your order was placed and will be delivered before 18:52"
  end

  attr_accessor :order

end
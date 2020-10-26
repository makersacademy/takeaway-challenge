require '/Users/ok/Projects/individual-challenges/takeaway-challenge/lib/notification.rb'
require '/Users/ok/Projects/individual-challenges/takeaway-challenge/lib/receipt.rb'

class Order
  attr_reader :items
  def initialize
    @items = []
  end

  def select(dish)
    @items << dish
  end

  def total
    @items.map { |dish| dish.price }.sum
  end

  def place
    confirmation = Notification.new
    confirmation.send_message("Thank you! Your order was placed and will be delivered
                              before #{(Time.new + 3600).strftime('%H:%M')}")
    print_receipt
  end

  private

  def print_receipt
    receipt = Receipt.new(@items, total)
    receipt.print
  end

end

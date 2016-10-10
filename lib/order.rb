require_relative './list_module'

class Order
  include List
  attr_reader :selections

  def initialize(messenger=SMS)
    @selections = []
    @messenger = messenger
  end

  def add(dish)
    @selections << dish
  end

  def selections
    @selections.dup
  end

  def summary
    puts "You have ordered the following #{@selections.count} items:\n\n"
    list_dishes(@selections)
    "\n\nTotal bill is #{bill}"
  end

  def bill
    total_bill
  end

  def confirm_order
    @messenger.send(confirmation)
  end

private

  def total_bill
    @bill = 0
    @selections.each do |dish|
      @bill += dish[:price]
    end
    @bill
  end

  def confirmation
    time=Time.new
    "Thank you! Your order was placed and will be delivered before #{time.hour+1}:#{time.min}."
  end


end

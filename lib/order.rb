require_relative './list_module'

class Order
  include List
  attr_reader :selections

  def initialize
    @selections = []
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
    "\n\nTotal bill is #{total_bill}"
  end

  def bill
    puts total_bill
  end

private

  def total_bill
    @bill = 0
    @selections.each do |dish|
      @bill += dish[:price]
    end
    @bill
  end


end

require_relative 'sub_takeaway'

class Order
  attr_reader :chosen_items

  def initialize(takeaway = SubTakeaway.new)
    @chosen_items = []
    @takeaway = takeaway
  end

  def choose(item, quantity = 1)
    @chosen_items <<  @takeaway.choose(item, quantity)
    "#{quantity} #{item}(s) added to your basket."
  end

  def basket_summary
    if @chosen_items.empty?
      puts "You currently have not added an item on the basket."
      return
    end
    puts "You currently have the following in your basket:"
    @chosen_items.each do  |basket|
      puts " #{basket[:quantity]} #{basket[:item]} - #{basket[:price]} each (#{basket[:quantity]*basket[:price]})"
    end
    puts "The current total is #{self.total}"
  end


  def total
    total_price = 0
    self.chosen_items.each do |basket|
      total_price += basket[:quantity] * basket[:price]
    end
    total_price
  end
end

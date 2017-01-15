class Order

  attr_reader :items, :takeaway, :summary

  def initialize(takeaway)
    @items = Hash.new(0)
    @takeaway = takeaway
  end

  def add_item(dish, quantity)
    @items[dish] += quantity
  end

  def summarise
    @summary = ""
    @items.each_key do |dish|
      summary << "#{dish} x#{@items[dish]} = £#{@takeaway.menu.dishes[dish] * @items[dish]}\n"
    end
    @summary
  end

end

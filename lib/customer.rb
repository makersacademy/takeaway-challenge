require_relative 'take_away'
class Customer
  attr_reader :m_takeaway
  def initialize 
    @basket = []
    @total = 0
    @m_takeaway = Takeaway.new
  end

  def add_item(item)
    if m_takeaway.menu.key?(item)
      @basket.push(item)
      cost = @m_takeaway.menu.fetch(item)
      @total += cost
    else 
      return "This is not a menu item"
    end
  end

  # def pick_resturant
  #   puts "enter a resturant: "
  # end
end
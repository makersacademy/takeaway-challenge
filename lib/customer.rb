require_relative 'take_away'
require_relative 'send-sms'

class Customer
  attr_reader :m_takeaway
  attr_reader :basket
  attr_reader :total
  attr_reader :sms
  def initialize 
    @basket = []
    @total = 0
    @m_takeaway = Takeaway.new
    @sms = Sms.new
    
  end

  def readmenu
    m_takeaway.list_menu
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

  def remove_item(item)
    if basket.include?(item) == false
      return "this item is not in your basket"
    else
      cost = @m_takeaway.menu.fetch(item)
      @total -= cost
      basket.delete_at(basket.find_index(item))

    end
  end

  def place_order
    puts "You have ordered! basket: #{basket}: cost: £#{total}"
    sms.send(basket,total)
  end

  # def pick_resturant
  #   puts "enter a resturant: "
  # end
end
class Menu
  DEFAULT_MENU = {fish: 1.49, chips: 0.49, falafel: 1.99, egg: 0.49}

  def initialize(items = DEFAULT_MENU)
    @items = items
  end

  def list
    
    @items.map do |food, price|
      return "#{food.capitalize} - £#{price}"
    end

  end

end
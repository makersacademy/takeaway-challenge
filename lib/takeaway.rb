class Takeaway

  attr_reader :name, :menu

  def initialize(name = "Bamboo Kitchen")
    @name = name
    @menu = { 
      'Spring Rolls': 2.99, 
      'Chicken Chow Mein': 6.99, 
      'Chilli Beef': 7.99
    }
  end

  def see_menu
    @menu.each do |item, price|
      p "#{item} : £#{price}"
    end
  end
end

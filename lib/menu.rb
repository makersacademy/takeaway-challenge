class Menu

  attr_reader :menu

  def initialize
    @menu = { fish: 6, chips: 2, sausage: 2.50, mushy_peas: 2 }
  end

  def show_menu
    @menu.each do |item, price|
      puts "£#{price} #{item}"
    end
  end

  def price(item)
    @menu[item]
  end 

end

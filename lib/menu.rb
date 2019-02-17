class Menu

  attr_reader :menu1, :menu2, :basket, :total

  def initialize
    set_menu  
    @basket = []
    @total = 0
  end
 
  def set_menu
    @menu = { 'spring roll' => 0.99, 
              'char sui bun' => 3.99, 
              'pork dumpling' => 2.99, 
              'peking duck' => 7.99, 
              'fu-king fried rice' => 5.99 }
  end

  def display
    false if @menu.empty? 
    x = 1
    @menu.each do |menu_option, price| 
      p "#{x}.   #{menu_option}    £#{price}"
      x += 1
    end
    return true
  end

  def include?(choice)
    @menu.include?(choice)
  end

  def get_price(choice)
    @menu.fetch(choice).to_f
  end
end

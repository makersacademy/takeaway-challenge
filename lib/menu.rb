class Menu 
  attr_accessor :menu_list
  def initialize
    @menu_list = [
      { dish: 'chiken', price: 5 },
      { dish: 'beef', price: 5 },
      { dish: 'turkey', price: 10 }
    ]
  end

  def availability
    @menu_list.map { |item| item[:available?] = rand(1..5) < 5 }
    @menu_list
  end
end
 
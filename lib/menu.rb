class Menu 
  attr_reader :menu_list
  def initialize
    @menu_list = [
      { dish: 'chiken', price: 5 },
      { dish: 'beef', price: 5 },
      { dish: 'turkey', price: 10 }
    ]
  end
end  
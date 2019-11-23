class Menu
attr_reader :menu, :dish, :price

  def initialize
    @menu = [{ :dish => "Sushi" , :price => 5 }, 
    { :dish => "Curry" , :price => 6 }, 
    { :dish => "Fried rice" , :price => 4 }, 
    { :dish => "Soup" , :price => 1 }]
  end

  def display
    @menu.each do |x|
      p "#{x[:dish]}: £#{x[:price]}"
    end
  end


end
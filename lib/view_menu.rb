class ViewMenu 

  def initialize
    @menu = Menu.new.dishes
  end

  def list_of_dishes
    @menu.each do |dish, price|
      puts "#{dish}: £#{price}"
    end
  end

end

class Menu

  def initialize(dishes)
    @dishes = dishes
  end

  def view_dishes
    @dishes.each do |dish|
      puts "#{dish.name.capitalize}:"
      dish.options.each do |option, price|
        puts "#{option.capitalize}: £#{price}"
      end
      puts
    end
  end

end

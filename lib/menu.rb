class Menu
  attr_reader :dishes

  def initialize(dishes = [])
    @dishes = dishes
  end

  def list
    return puts 'The menu is empty' if no_dishes?
    print_dishes
  end

  private

  def no_dishes?
    @dishes.empty?
  end

  def print_dishes
    @dishes.each do |dish|
      puts "#{dish.name}, #{dish.price}"
    end
  end
end

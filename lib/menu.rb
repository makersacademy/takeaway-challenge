class Menu
  attr_reader :dishes

  def initialize(dishes = [])
    @dishes = dishes
  end

  def list
    raise 'The menu is empty' if no_dishes?
    @dishes.each do |dish|
      puts "#{dish.name}, #{dish.price}"
    end
  end

  private

  def no_dishes?
    @dishes.empty?
  end
end

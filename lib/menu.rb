class Menu
  def initialize
    @dishes = []
  end

  def add_dish(dish)
    @dishes << dish
  end

  def list
    raise 'Error: Menu has no items' if empty?
    @dishes.each do |dish|
      puts "#{@dishes.index(dish) + 1}. #{dish.name} - £#{dish.price}"
    end
  end

private

  def empty?
    @dishes.empty?
  end

end

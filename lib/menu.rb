class Menu

  def initialize(dishes = [])
    @dishes = dishes
  end

  def dishes
    @dishes.dup
  end

  def add(*dishes)
    dishes.each { |dish| @dishes << dish }
  end

  def view
    puts "~~~Menu~~~"
    dishes.uniq.each do |dish|
      puts info(dish)
    end
  end

  private
  def info(dish)
    "#{dish}, £#{dish.price}"
  end

end

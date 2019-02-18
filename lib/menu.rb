class Menu

  def initialize
    @dishes = []
  end

  def list
    @dishes.each do |dish|
      puts "#{dish.name} : #{'%.2f' % (dish.price / 100)}"
    end
  end

  def add(dish)
    @dishes << dish
  end
end

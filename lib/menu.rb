class Menu

  attr_reader :list

  def initialize
    @list = {}
  end

  def display
    count = 1
    @list.each do |food, price|
      "#{count}. #{food} #{price}"
      count += 1
    end
  end

  def add_item(food,price)
    @list.store(food,price)
  end

end

class List

  attr_reader :dishes, :cost, :menu

  def initialize
    @menu = menu
    @dishes = []
  end

  def add_list(item, number, items)
    number.times { @dishes << items.keys[item - 1] }
  end

  def current_total
    @cost = 0
    @dishes.each do |x|
      @cost += @menu.items.values[x - 1]
    end
  end

end

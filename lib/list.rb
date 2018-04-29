class List

  attr_reader :dishes, :cost

  def initialize(menu = Menu.new)
    @dishes= []
    @menu = menu
  end

  def add_list(item, number)
    number.times { @dishes << item }
  end

  def current_total(total)
    @cost = 0
    @dishes.each do |x|
      @cost += @menu.items.values[x - 1]
    end
  end

end

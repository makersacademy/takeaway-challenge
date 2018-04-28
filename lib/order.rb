class Order

  attr_reader :total

  def initialize
    @selected_dishes = []
    @total = 0
  end

  def selected_dishes
    @selected_dishes.dup
  end
end

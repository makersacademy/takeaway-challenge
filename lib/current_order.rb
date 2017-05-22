class CurrentOrder

  attr_reader :ordered_dishes

  def initialize
    @ordered_dishes = []
  end

  def ordertotal(ordered_dishes = @ordered_dishes)
    ordered_dishes.inject(0) { |sum, dish| sum + dish[:price] }
  end

end

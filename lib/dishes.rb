class Dishes
  attr_reader :available, :available_dishes

  def initialize(available = true)
    @available = available
    @available_dishes = []
  end

  def available?
    @available
  end
end
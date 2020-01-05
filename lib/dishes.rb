class Dishes

  attr_reader :list_of_dishes

  def initialize
    @list_of_dishes = { :carbonara => 7.80, :noodles => 5.40, chicken: 6.00 }
  end
end
class DishList

  def initialize
    @list = {
      burger: 15,
      lobster: 19,
      nachos: 5
    }
  end

  def data
    @list.dup
  end
end

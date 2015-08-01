
class List
  DEFAULT_DISHES = {
                    :burrata => 6, :lasagna => 11,
                    :risotto => 10, :parmigiana => 12.50,
                    :quinoa_salad => 7.50
                  }
  attr_accessor :available

  def initialize
    @available = Hash.new
  end

  def load_predefined_dishes
    @available = DEFAULT_DISHES
  end

  def add_dish name
    @available[dish.name] = dish.price
  end

end
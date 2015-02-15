


class Dish

  attr_accessor :info

  def initialize(name, category, price)
    @info =  { :name => name, :category => category.to_sym, :price => price}
  end

end







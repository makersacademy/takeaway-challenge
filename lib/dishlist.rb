require_relative './dishlist_generator'

class Dishlist

  def initialize(restaurant: nil, dishlist_generator: Dishlist_generator.new)
    @dishes = dishlist_generator.create_list(category)
  end

  def dishes
    @dishes.dup
  end

end

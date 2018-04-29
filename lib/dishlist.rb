require_relative './dishlist_generator'

class Dishlist

  def initialize(category: nil, dishlist_generator_class: DishlistGenerator, menu_handler: nil)
    @dishlist_generator = dishlist_generator_class.new(menu_handler: menu_handler)
    @dishes = @dishlist_generator.create_list(category)
  end

  def dishes
    @dishes.dup
  end

end

class Basket
  # respobsible for updating the basket and calculate total

  def initialize
    @content = []
  end

  def content
    @content.dup.freeze
  end

  def add(dish)
    @content << dish
  end

  def remove(dish)
    @content.delete(dish)
  end
end

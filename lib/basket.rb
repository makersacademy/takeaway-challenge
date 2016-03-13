class Basket
  # respobsible for updating the basket and calculate total

  def initialize
    @content = []
  end

  def content
    @content.dup.freeze
  end

  def add(*dishes)
    dishes.each { |dish| @content << dish }
  end

  def remove(*dishes)
    dishes.each { |dish| @content.delete(dish) }
  end
end

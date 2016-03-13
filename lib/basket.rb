class Basket
  # respobsible for updating the basket and calculate total

  def initialize
    @content = []
  end

  def content
    @content.dup.freeze
  end

  def add(dish)
    in_basket?(dish) ? add_qty(dish) : @content << dish
  end

  def remove(dish)
    raise 'You did not add this dish' unless in_basket?(dish)
    reduce_qty(dish)
    @content.select! {|i| i[:amount] > 0}
  end

  private

  def in_basket?(dish)
    @content.any? {|i| i[:name] == dish[:name]}
  end

  def add_qty(dish)
    @content.each {|i| i[:amount] += dish[:amount] if i[:name] == dish[:name] }
  end

  def reduce_qty(dish)
    @content.each {|i| i[:amount] -= dish[:amount] if i[:name] == dish[:name] }
  end
end

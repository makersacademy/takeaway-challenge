class Basket

  def initialize
    @content = []
    @total = 0
  end

  def content
    @content.dup.freeze
  end

  def add(dish)
    in_basket?(dish) ? update_qty(dish) : @content << dish
  end

  def remove(dish)
    raise 'None in the basket' unless in_basket?(dish)
    reduce_qty(dish)
    @content.select! {|i| i[:amount] > 0}
  end

  def calc_total
    raise 'Basket is empty' if @content.empty?
    @content.each {|dish| @total += (dish[:amount] * dish[:price])}
    @total
  end

  private

  def in_basket?(dish)
    @content.any? {|i| i[:name] == dish[:name]}
  end

  def update_qty(dish)
    @content.each {|i| i[:amount] += dish[:amount] if i[:name] == dish[:name] }
  end

  def reduce_qty(dish)
    @content.each {|i| i[:amount] -= dish[:amount] if i[:name] == dish[:name] }
  end
end

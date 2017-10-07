class Basket

  def initialize

    @list = []

  end

  def add(dish, totalprice)
    @list << [dish, totalprice] 
  end

  def total
    fail('no items have been added to the basket') if list.empty?
    sum = 0
    list.each { |item| sum += item[1] }
    sum
  end

  def summary
    compile_order.each { |item| puts print(item) }
  end

  private

  attr_reader :list

  def compile_order
    list.group_by(&:first).map do |x, y|
      [x, y.count, y.inject(0){ |sum, i| sum + i.last }]
    end
  end

  def print(item)
    "#{item[1].to_s} #{item[0]} = £#{item[2]}"
  end

end

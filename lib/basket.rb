class Basket

  def initialize
    @list = []
  end

  def add(dish, price)
    @list << [dish, price] 
  end

  def total
    validate_basket
    calculate_total
  end

  def summary
    validate_basket
    compile_order.each { |item| print(item) }
  end

  def reset
    @list = []
  end

  private

  attr_reader :list

  def compile_order
    list.group_by(&:first).map do |x, y|
      [x, y.count, y.inject(0) { |sum, i| sum + i.last }]
    end
  end

  def print(item)
    puts "#{item[1]} #{item[0]} = £#{item[2]}"
  end

  def calculate_total
    sum = 0
    list.each { |item| sum += item[1] }
    sum
  end

  def validate_basket
    fail('no items have been added to the basket') if list.empty?
  end

end

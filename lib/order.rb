require_relative './takeaway.rb'


class Order

  def items(array)
    regex(array)
  end

  private

  def regex(array)
    values = array.map{ |string| string.scan(/£(.+)$/) }
    sum(values)
  end

  def sum(values)
    '%.2f' % values.flatten.map(&:to_f).reduce(0, :+)
  end
end
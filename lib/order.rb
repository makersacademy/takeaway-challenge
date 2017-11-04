class Order

  def total(items)
    total = 0
    items.each do |x, y|
      total += x[:price]
    end
    total
  end

  def check_total(items, previous_total)
    total = 0
    items.each do |x, y|
      total += x[:price]
    end
    raise 'Wrong total!' unless total == previous_total
    total
  end

private


end

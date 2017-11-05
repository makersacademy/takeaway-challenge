class Order

  def total(items)
    total = 0
    items.each do |x, _y|
      total += x[:price]
    end
    puts "Order total £#{total}!"
    total
  end

  def check_total(items, previous_total)
    total = 0
    items.each do |x, _y|
      total += x[:price]
    end
    raise 'Wrong total!' unless total == previous_total
    puts "Order checked and correct!"
    total
  end
end

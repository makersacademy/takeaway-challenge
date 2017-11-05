class Calculate

  def total(basket)
  total = 0
    basket.each do |x, _y|
      total += x[:price]
    end
  total
  end
end

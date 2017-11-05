class Calculate

  def total(basket)
    total = 0
    basket.each do |key, _value|
      total += key[:price]
    end
    total
  end
end

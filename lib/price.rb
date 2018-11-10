class Price
  def self.format(pence)
    pence_array = arrayify_pence(pence)
    if less_than_pound?(pence)
      2.times { pence_array.unshift("0") }
      add_decimal_point(pence_array)
    else
      add_decimal_point(pence_array)
    end
  end

  private
  def self.add_decimal_point(pence_array)
    pence_array.insert(-3, '.').join
  end

  def self.arrayify_pence(pence)
    pence.to_s.chars
  end

  def self.less_than_pound?(pence)
    pence.to_s.size <= 2
  end
end

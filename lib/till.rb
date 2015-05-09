module Till

  def total items
    items.map(&:values).flatten.inject{ |sum, x| sum + x }
  end

  def display_order dishes
    receipt = []
    dishes.each do |h|
      h.each { |k, v| receipt << "#{k} @ #{v} x #{dishes.map(&:keys).flatten.count(k)}" }
    end
    "#{receipt.uniq}; TOTAL: #{total dishes}"
  end

end
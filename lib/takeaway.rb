class Takeaway

  def initialize(dishes = {})
    @dishes = dishes
  end

  def see_dishes
    @dishes.each { |name, price| puts "#{name.capitalize} - £#{price}" }
  end

  def select_dishes(items, quantities, total_price)
  end

end

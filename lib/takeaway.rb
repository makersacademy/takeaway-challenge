class Takeaway
  attr_reader :dishes

  def initialize(dishes = {onion_bhaji: 2.95, chicken_tikka_masala: 7.95, naan: 1.95})
    @dishes = dishes
  end

  def select_dishes(order)
    order.each do |key, value|
      raise 'Bouillabaisse is not available.' unless dishes.has_key? key
    end
  end
end
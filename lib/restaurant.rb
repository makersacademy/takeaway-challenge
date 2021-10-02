class Restaurant
  attr_reader :dishes, :availability

  def initialize
    @dishes = { 1 => ["Soup", 3.50],
                2 => ["Chips", 4] }
    @availability = false
  end

  def available?(item)
    !availability if dishes.has_key?(item)
  end
end

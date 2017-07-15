class Menu

  attr_reader :name

  def initialize(name, *dishes)
    @name = name
    @dishes = Hash.new(0)
    load_dishes(dishes)
  end

  def dishes
    @dishes.dup
  end

  private

  def load_dishes(dishes)
    fail "No dishes in the menu" if dishes.empty?
    dishes.each_slice(2) do |name, price|
      fail "Invalid dish name '#{name}'" unless name.is_a?(String)
      fail "Invalid dish price '#{price}'" unless price.is_a?(Numeric) && price > 0
      @dishes[name] = price.round(2)
    end
  end

end

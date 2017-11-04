class Dish
  attr_reader :name, :options

  def initialize(name, options_hash)
    @name = name
    @options = options_hash
  end
end

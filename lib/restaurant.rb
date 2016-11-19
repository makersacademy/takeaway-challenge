#Will be placing and checking out orders
class Restaurant

  attr_reader :name
  DEFAULT_NAME = "Top 5"
  def initialize(name = DEFAULT_NAME)
    @name = name
  end
end

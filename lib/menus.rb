class Pizza

  attr_reader :menu

  def initialize
    @menu = {
      "margarita" => 7.5,
      "hawaian" => 8.5,
      "garlic bread" => 5
    }
  end

end

class Chinese

  attr_reader :menu

  def initialize
    @menu = {
      "sweet and sour chicken" => 7.5,
      "BBQ ribs" => 8.5,
      "special fried rice" => 5
    }
  end

end

class Indian

  attr_reader :menu

  def initialize
    @menu = {
      "chicken korma" => 7.5,
      "tandoori grill" => 8.5,
      "keema naan" => 5
    }
  end

end

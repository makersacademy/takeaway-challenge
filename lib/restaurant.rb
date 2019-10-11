class Restaurant
  attr_reader :menu

  def initialize
    @menu = {
      'chicken_burgers' => 2.50,
      'beef_burgers' => 2.50,
      'chips' => 1.00
    }
  end
end

class Menu

  attr_reader :starters
  
  def initialize
    @starters = {
      "poppadoms" => 0.99,
      "chutney" => 0.55,
      "chana dal" => 4.99,
      "secret samosa" => 2.50
    }
  end
end
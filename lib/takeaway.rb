class Takeaway
  attr_reader :menu

  def initialize
    @menu = { "burritos" => 7, "tacos" => 5, "chips" => 3, "guacamole" => 2 }
  end
end

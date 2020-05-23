class Takeaway
  attr_reader :dishes
  def initialize
    @dishes = [
      { "marinara" => 5 },
      { "margherita" => 6 },
      { "napoli" => 6 },
      { "calzone" => 8 }
    ]
  end
end

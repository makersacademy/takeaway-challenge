class Takeaway
  attr_reader :menu
  def initialize
    @menu = {
      "pelmeni" => 6.99, "borscht" => 4.99, 
      "salat" => 5.99, "olivier" => 9.99, 
      "tvarog" => 2.99, "smetyana" => 1.99
    }
  end

end

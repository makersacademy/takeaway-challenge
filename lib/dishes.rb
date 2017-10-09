class Dishes

  attr_reader :list

  def initialize
    @list = {
      "Chop Suey" => 15.99,
      "Thai Curry" => 11.99,
      "Singapore Noodles" => 9.99
    }
  end

end

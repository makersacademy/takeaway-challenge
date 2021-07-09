class List

  attr_reader :menu

  def initialize
    @menu = {
     "Coffee" => 2.50,
      "Soft Drink" => 1.50,
      "Sandwich (Cold)" => 5.90,
      "Sandwich (Hot)" => 8.90,
      "Fresh Juices" => 4.70,
      "Pastries" => 1.80
    }
  end

end

#  @menu = [
#       {:dish => "Coffee", :price => 2.50}
#       {:dish => "Soft Drink", :price => 1.50}
#       {:dish => "Sandwich (Cold)", :price => 5.90}
#       {:dish => "Sandwich (Hot)", :price => 8.90}
#       {:dish => "Fresh Juices", :price => 4.70}
#       {:dish => "Pastries", :price => 1.80}
      # "Coffee" => 2.50
#       "Soft Drink" => 1.50,
#       "Sandwich (Cold)" =>  5.90,
#       "Sandwich (Hot)" =>  8.90,
#       "Fresh Juices" => 4.70,
#       "Pastries" => 1.80,
#     ]
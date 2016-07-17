class Starters
  attr_accessor :starters

def initialize
  @starters = []
  self.list
end

def list
  CSV.open("/Users/thadycondon/Documents/Projects/takeaway-challenge/lib/starters.csv", :row_sep => :auto, :col_sep => ",") do |dishes|
  dishes.each { |dish, price| @starters << {dish => price} }
  end
end

end

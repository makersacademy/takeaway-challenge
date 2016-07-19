require 'csv'

class Starters
  attr_reader :list, :starters

def initialize
  @starters = {}
  self.list
end

def list
  CSV.open(File.dirname(__FILE__)+'/starters.csv', :row_sep => :auto, :col_sep => ",") do |dishes|
  dishes.each { |dish, price| @starters.merge!(dish => price) }
  end
end

end

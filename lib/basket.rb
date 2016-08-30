class Basket

  attr_reader :ordered
  attr_reader :total

  def initialize
    @ordered = Hash.new(0)
    @total = 0
  end

  def empty?
    @ordered == {} && @total == 0
  end

end

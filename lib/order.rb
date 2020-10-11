class Order

  attr_reader :selection, :total

  def initialize
    @selection = []
  end

  def add(choice)
    @selection << choice
  end

  def selection
    @selection
  end

  def total
    prices = @selection.flatten.keep_if do |obj|
      obj.is_a? Float
    end
    prices.sum
  end

end

class Selection

  attr_reader :choices

  def initialize
    @choices = []
  end

  def add(choice, quantity)
    @choices << { choice: choice, quantity: quantity }
  end

  def total
    @summary = Summary.new(@choices)
    @summary.total
  end

end

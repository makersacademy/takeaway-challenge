class Selection

  attr_reader :choices

  def initialize
    @choices = []
  end

  def add(choice)
    @choices << choice
  end

end

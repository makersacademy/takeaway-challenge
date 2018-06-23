class Selection

  attr_reader :choices

  def initialize
    @choices = []
  end

  def add(choice)
    @choices << choice
  end

  def print_summary
    @summary = Summary.new(@choices)
    "#{@choices.join(", ")} | Total: £#{@summary.total}"
  end

end

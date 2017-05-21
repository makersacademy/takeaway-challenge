class Cart

  attr_reader :list

  def initialize
    @list = []
  end

  def select_item(selection)
    @list << selection
  end
end

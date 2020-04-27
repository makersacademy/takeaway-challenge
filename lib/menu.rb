class Menu

  attr_reader :list

  def initialize(list)
    @list = list

  end

  def generator
    @list.join(" ")
  end
end

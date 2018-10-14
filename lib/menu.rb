class Menu

  def initialize(items)
    @data = items
  end

  def data
    @data.dup
  end

end

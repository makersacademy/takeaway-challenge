class Order

  def initialize
    @selection = {}
  end

  def add(choice)
    @selection.merge!(choice)
  end

  def selection
    @selection
  end

end

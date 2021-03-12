class Restaurant

attr_reader :name, :menu

  def initialize(name)
    @name = name
    @menu = []
  end
end

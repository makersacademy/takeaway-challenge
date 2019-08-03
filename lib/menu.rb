class Menu

attr_reader :menu

  def initialize
    @menu = {}
    @menu[:pizza] = 7
    @menu[:kebab] = 8
    @menu[:burger] = 5
    @menu[:chips] = 3
  end

end

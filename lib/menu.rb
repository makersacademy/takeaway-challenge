
class Menu
  def initialize(dishes)
    @dishes = dishes
  end

  def view
    Viewer.new(@dishes)
  end
end
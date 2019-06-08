class Menu
  attr_reader :list
  def list
    @list = {
      burger: 5,
      pizza: 7,
      chicken: 6
    }
  end
end

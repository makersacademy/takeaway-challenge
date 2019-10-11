class MainMenu

  attr_reader :dishes

  def initialize(specials = nil)
    @dishes = {'name' => 0.00, 'curry' => 2.20, 'pizza' => 5.00}
    @dishes << specials if specials != nil
  end

end

class Menu

  attr_reader :dishes

  def initialize
    @dishes = [:chicken, :beef, :pasta, :pizza, :burger]
  end

  def show_menu
    @dishes.each { |dish| puts dish }
  end

end

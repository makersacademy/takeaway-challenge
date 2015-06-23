class Menu
  def initialize
    @menu = { cheese_burger: 5,
              hotdog:        4,
              lasagne:       5,
              beer:          2,
              coke:          2,
              cheese_cake:   3}
  end

  def show
    menu
  end

  private
  attr_reader :menu
end

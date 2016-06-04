class Menu
  def initialize
    @menu = {'chips' => '£1', 'oreos' => '£3', 'milkshake' => '£2'}
  end

  def show
    @menu
  end

  def order(item, quantity=1)
    fail 'unknown item inputted, please enter an item on the menu' if !(@menu.include? item)
  end
end

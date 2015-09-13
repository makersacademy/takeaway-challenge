class Menu

  attr_reader :menu, :order

  def initialize
    @menu = ({ :dish => 'price',
               :hamburger => 2,
               :pizza => 5 })
    @order = []
  end

  def check_menu
    menu
  end

  def select_dishes(selection)
    if menu.to_s.include? selection
      order << selection
    end
    # if selection is on menu add to array, if not raise error saying that is not on the menu
  end


end
class Takeaway

attr_reader :basket, :menu

  def initialize(menu: )
    @menu = menu
    @basket = []
  end

  def print_menu
    menu.print
  end

  def add_item(item)
    # raise 'Sorry that item is not on the menu' unless menu.key?(item)
    basket << item
  end

  private

  # attr_reader :menu

end

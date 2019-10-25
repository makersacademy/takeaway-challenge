# The TakeawayMenu class
class TakeawayMenu
  attr_reader :takeaway_dishes

  MENU_TITLE = 'Menu List:'
  private_constant :MENU_TITLE
  
  def initialize(*takeaway_dishes)
    @takeaway_dishes = [*takeaway_dishes]
  end
end

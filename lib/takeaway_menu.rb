# The TakeawayMenu class
class TakeawayMenu
  attr_reader :takeaway_dishes
  
  def initialize(*takeaway_dishes)
    @takeaway_dishes = [*takeaway_dishes]
  end
end

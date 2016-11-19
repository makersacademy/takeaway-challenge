class Menu
  attr_reader :list
  def initialize
    @list = {
      bacon_sandwich: 4,
      scrambled_eggs: 5,
      poached_eggs: 4,
      toast: 1
    }
  end

end

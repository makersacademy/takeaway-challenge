class Takeaway
  attr_reader :menu_list

  def initialize
    # @menu_list = menu_list
    @menu_list = [{ :Chicken => "£4", :Mutton => "£7" }]
  end

  def menu(*)
    # list = @menu_list
    p @menu_list

  end

end

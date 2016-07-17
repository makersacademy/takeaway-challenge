
class Restaurant

 attr_reader :menu

  def initalize
    menu = {
      :pasta => 4.50,
      :curry => 3.70,
      :burger => 2.80,
    }
   end
  def show_menu
    @menu
  end

end

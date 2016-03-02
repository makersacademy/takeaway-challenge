
class Menu

  attr_reader :menu_list

  def initialize
    @menu_list = {}
    @menu_list['Chicken Tagine']=5.00
    @menu_list['Meatball Tagine']=5.00
    @menu_list['Lentils']=3.00
    @menu_list['Bread']=0.50
  end

  def list
    @menu_list.dup
  end

  

end

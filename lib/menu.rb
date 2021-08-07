# class will contain a menu in which we can adjust what is availble using instance variables ?
class Menu 
  attr_reader :menu
  
  def initialize 
    list = {
      :pizza => "8.99",
      :noodles => "6.99",
      :chips => "3.99"
    }
    @menu = list
  end
end


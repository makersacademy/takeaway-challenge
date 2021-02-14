require './basket'
require './ui'

class Menu
  attr_reader :menu

 def initialize(menu = [{:number => 1,:name => 'Kadhai Chicken',:price => 6.95 },
          {:number => 2,:name => 'Chicken Rendang ',:price => 6.95 },
          {:number => 3,:name => 'Murghi Makhani ',:price => 7.45 }])
   @menu = menu
 end
end

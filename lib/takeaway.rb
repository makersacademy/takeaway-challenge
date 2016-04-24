require_relative 'menu'

class Takeaway



def menu_list
 @menu
end

private

attr_reader :menu

def initialize

  @menu = Menu.new

end


end
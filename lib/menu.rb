class Menu

attr_accessor :list_of_dishes

  def initialize
    @list_of_dishes = {balti: 5.00, vindaloo: 4.50}
  end

  def print_menu
    list_of_dishes.map {|key,value| "#{key} £#{value}"}.join(" , ")
  end
end


private

class Dishes

  attr_reader :list

  def initialize
    @list = [{:dish => "curry", :price => 1.00},
    {:dish => "xcurry", :price => 1.00}]
  end

  # def menu_list
  #   {:dish => "curry", :price => 1.00}
  #   {:dish => "xcurry", :price => 1.00}
  # end

end

class Menu
  attr_reader :list

  def initialize
    @list = [{ :dish => 'green curry', :price => 3.00 },
            { :dish => 'singapore noodles', :price => 4.00 },
            { :dish => 'salmon teriyaki', :price => 5.00 }]

  end

  def view_menu
    @list
  end

end

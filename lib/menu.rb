require_relative 'customer'

class Menu

  def initialize
    @menu = [{:item => 'Cod', :price => '£9.50', 
              :item => 'Chips', :price => '£2.50', 
                :item => 'Haddock', :price => '£8.50', 
                  :item => 'Saveloy', :price => '£3.50', 
                    :item => 'Wally', :price => '£1.50'}]
  end

  def show_menu
    @menu = @current_menu

  end

end
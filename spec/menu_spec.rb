require 'menu'

describe Menu do

  let (:menu) { Menu.new }

    it 'Menu should have a list of dishes' do
      dishes = {  :Burger => 5.00,
                  :Fries => 2.00,
                  :Pizza => 8.00,
                  :Wings => 3.00
        }
        expect(menu.dishes).to eq dishes
    end



  # it 'should hold a list of dishes with prices' do
  #   menu = Menu.new
  #   menu.add_item('fries', 3.0)
  #   expect(menu.list).to include ({'fries' => '%.02f' % 3.0})
  # end

end

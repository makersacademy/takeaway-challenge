require 'menu'

describe Menu do
it 'must show a list of dishes with prices' do
  menu=Menu.new
expect(menu.dish_list).to eq ({:chicken => 3, :beef => 4, :pizza => 5})
end





end

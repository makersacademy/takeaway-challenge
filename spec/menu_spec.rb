# require 'menu'
# #require 'meatdish'
#
# describe Menu do
#     before(:each) do
#         @menu = Menu.new
#         @food_doub = double('food')
#         @price_doub = double('price')
#
#     end
#
#     describe '#view_menu'do
#         it  {is_expected.to respond_to(:view_menu)}
#         it 'prints a menu' do
#             expect(subject.view_menu).to eq ({})
#         end
#     end
#
#     describe '#add_food' do
#         it {is_expected.to respond_to(:add_food).with(2).argument}
#         it 'adds a food item to menu_list' do
#             expect(@menu.add_food(@food_doub, @price_doub)).to eq (@price_doub)
#         end
#     end
# end

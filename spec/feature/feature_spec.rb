# require 'capybara/rspec'
# require 'takeaway'
#
# describe 'Customer features' do
#   subject(:takeaway) { Takeaway.new }
#
#   feature 'see name and prices of dishes on menu' do
#     it 'includes menu item' do
#       expect(takeaway.show_menu).to match('Lasagne Al Forno: £10.5')
#     end
#   end
#   feature 'select dishes from the menu' do
#     it 'adds dishes to basket' do
#       takeaway.order('Lasagne Al Forno', 3)
#       expect(takeaway.basket).to include('Lasagne Al Forno' => 3)
#     end
#   end
#   feature 'see total of price to pay' do
#     it 'before checkout' do
#       takeaway.order('Lasagne Al Forno', 3)
#       takeaway.order('Fettuccine Al Salmone', 3)
#       expect(takeaway.total).to match('64.35')
#     end
#   end
#   feature 'when checking out' do
#     it 'raises an error when not giving the right total' do
#       takeaway.order('Fettuccine Al Salmone', 3)
#       expect {takeaway.checkout(30.95)}.to raise_error 'Wrong total'
#     end
#     it 'sends a confirmation text' do
#       takeaway.order('Spaghetti Carbonara', 2)
#       msg = "Spaghetti Carbonara x2: £19.0"
#       total = "Total price: £19.0"
#       expect(takeaway).to receive(:send_text).with(msg, total)
#       takeaway.checkout(19)
#     end
#   end
# end

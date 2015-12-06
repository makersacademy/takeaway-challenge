require 'menu'
require 'takeaway'

describe 'User Stories' do
  let(:takeaway) { Takeaway.new(menu) }
  let(:menu) { Menu.new }

  context  do
    before(:each) do
      takeaway.menu.create(:soup, 4.99)
      takeaway.menu.create(:sandwich, 5.99)
      takeaway.menu.create(:pie, 7.99)
    end

  describe 'User Story 1' do
    # As a customer
    # So that I can check if I want to order something
    # I would like to see a list of dishes with prices
    context 'when a customer reads the menu ' do
      it 'it should display the dishes and prices' do
        expect(takeaway.check_menu).to include(pie: 7.99)
      end
    end
  end
  end
end


#
#   describe 'User Story 2' do
#   # As a customer
#   # So that I can order the meal I want
#   # I would like to be able to select some number of several available dishes
#     context 'when a customer wants a dish' do
#       it 'it should let them place an order' do
#         takeaway.place_order(:soup, 1)
#         takeaway.place_order(:sandwich, 3)
#         expect(takeaway.check_order).to eq('soup'=>1,'sandwich'=>3)
#       end
#     end
#   end
# end
#
#   describe 'User Story 3' do
#   # As a customer
#   # So that I can verify that my order is correct
#   # I would like to check that the total I have been given matches the sum of the various dishes in my order
#     context 'when a customer places an order' do
#       it 'it should return the final bill' do
#         takeaway.place_order('Bombay Aloo', 3)
#         takeaway.place_order('Lamb Passanda', 4)
#         expect(takeaway.check_order).to eq "3 x Bombay Aloo: £15\n4 x Lamb Passanda: £36\n Total: £51"
#       end
#     end
#   end
#
# end

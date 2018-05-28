require 'confirm_order'

describe ConfirmOrder do


end 
# describe ConfirmOrder do
#   let (:menu) { double('menu') }
#   subject(:confirm_order) do
#   described_class.new(menu, requested_order, expected_total)
#   end
#
#   before do
#     allow(menu).to receive(:menu_list).and_return(
#       {
#         banana: 1.99,
#         strawberry: 2.99,
#         peach: 3.99,
#         coconut: 4.99
#       }
#     )
#   end

#   context 'when requested order is valid' do
#     let(:requested_order) { {banana: 2, peach: 1} }
#     let(:expected_total) { 7.97 }
#
#     it 'confirms ordered items are on the menu' do
#       expect(confirm_order.order_valid?).to eq true
#     end
#
#     it 'totals the order' do
#       expect(confirm_order.calculate_total).to eq 7.97
#     end
#
#     it 'confirms expected_total matches actual_total' do
#       expect(confirm_order.expected_total).to eq (confirm_order.calculate_total)
#     end
#
#     context 'when expected_total does not match actual_total' do
#       let(:expected_total) { 8.97 }
#
#       it 'raises an error if expected_total does not match actual_total' do
#         expect{ confirm_order.calculate_total }.to raise_error 'Incorrect total'
#       end
#
#     end
#   end
#
#   context 'when requested order is invalid' do
#     let(:requested_order) { {pear: 2, peach: 1} }
#     let(:expected_total) { 7.97 }
#
#     it 'confirms ordered items are not on the menu' do
#       expect(confirm_order.order_valid?).to eq false
#     end
#
#     it 'raises an error that order is invalid' do
#       error = 'Order not valid'
#       expect{ confirm_order.raise_error_for_invalid_order }.to raise_error(error)
#     end
#   end
# end

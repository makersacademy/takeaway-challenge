# require 'order'
#
# describe Order do
#
#   subject(:menu) { described_class.new }
#
#   describe '#initialize' do
#
#     it 'initializes with an empty order' do
#         expect(subject.new_order).to be_empty
#     end
#
#
#   end
#
#   describe '#add_item' do
#
#     it 'allows a customer to add items' do
#       subject.add_item(:item_1)
#       subject.add_item(:item_2)
#       expect(subject.new_order).to eq(:item_1 => 1, :item_2 => 1)
#     end
#
#   end
#
# end

# require 'basket'
#
# describe Basket do
#   subject(:basket) { Basket.new }
#   describe '#add' do
#     it 'item to shopping_basket' do
#       basket.add :item, 1
#       expect(basket.content).to include [:item, 1]
#     end
#   end
#   describe '#show_content' do
#     it 'lists content and price' do
#       basket.add :item1, 2
#       basket.add :item2, 5
#       content = "item1 x2: £2\nitem2 x5: £7.5"
#       expect(basket.show_content).to eq content
#     end
#   end
# end

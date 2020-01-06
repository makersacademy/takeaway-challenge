# require 'shopping_basket'
#
# describe ShoppingBasket do
#
#   describe 'initialization' do
#
#     it 'should init with empty array' do
#       expect(subject.basket).to eq([])
#     end
#   end
#
#   describe '#add_item' do
#
#     it 'should respond to add_item' do
#       expect(subject).to respond_to(:add_item).with(1).arguments
#     end
#
#     it 'should add an item to basket array' do
#       item = double :item
#     subject.add_item(item)
#     expect(subject.basket).to include(item)
#     end
#
#     it 'should change the length of the basket array' do
#       item = double :item
#       subject.add_item(item)
#       subject.add_item(item)
#       expect(subject.basket.length).to eq 2
#     end
#
#   end
#
#   describe "#print_basket" do
#
#     it "prints pizza string when added to basket" do
#       subject.add_item({:pizza=>10})
#       subject.pizza_count +=1
#       expect {subject.print_basket}.to output("1 x Pizza, Cost: £10\nTotal cost: £10\n").to_stdout
#     end
#
#   end
#
#   describe "#totalizer" do
#
#     it "returns total cost of £10 when pizza is in basket" do
#       subject.add_item({:pizza=>10})
#       expect(subject.totalizer).to eq(10)
#     end
#
#     it "returns total cost of £18 when pizza + pasta is in basket" do
#       subject.add_item({:pizza=>10, :pasta=>8})
#       expect(subject.totalizer).to eq(18)
#     end
#
#   end
#
# end

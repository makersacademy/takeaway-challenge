require 'takeaway'

describe Takeaway do

  let(:subject) {described_class.new}
  let (:dish) {double :dish}
  let (:qnty) {double :qnty}


describe "#place_an_order" do
  it { is_expected.to respond_to(:place_an_order).with(2).argument }
  it 'raises an error if dish is not listed in the menu' do
    message = 'Item is not listed in the menu'
    expect{subject.place_an_order(:dish, :qnty)}.to raise_error message

  end
  end


describe '#basket' do

#   it 'stores an order' do
#     subject.place_an_order(:dish, :qnty)
#     expect(subject.basket).to eq "Items in your basket: #{[{:dish => :qnty}]}"
# end
#  it 'can stores a number of orders' do
#    subject.place_an_order(:dish, :qnty)
#    subject.place_an_order(:dish, :qnty)
#    message = "Items in your basket: #{[{:dish => :qnty}, {:dish=>:qnty}]}"
#    expect(subject.basket).to eq message
#  end
end
end

require 'takeaway'

describe Takeaway do

  let(:subject) {described_class.new}
  let (:dish) {double :dish}
  let (:qnty) {double :qnty}
  it { is_expected.to respond_to(:print_menu) }

describe "#place_an_order" do
  it { is_expected.to respond_to(:place_an_order).with(2).argument }
  end


describe '#basket' do
  
  it 'stores an order' do
    subject.place_an_order(:dish, :qnty)
    expect(subject.basket).to eq "Items in your basket: #{[{:dish => :qnty}]}"
end
 it 'can stores a number of orders' do
   subject.place_an_order(:dish, :qnty)
   subject.place_an_order(:dish, :qnty)
   message = "Items in your basket: #{[{:dish => :qnty}, {:dish=>:qnty}]}"
   expect(subject.basket).to eq message
 end
end
end

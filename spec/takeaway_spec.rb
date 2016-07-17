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

  it 'stores an order' do
    subject.place_an_order("King Prawn Noodles", 5)
    expect(subject.basket).to eq "{\"King Prawn Noodles\"=>5}"
    subject.basket
  end
 it 'can stores a number of orders' do
   subject.place_an_order("Beef Fried Rice")
   subject.place_an_order("Beef Fried Rice", 2)
   expect(subject.basket).to eq "{\"Beef Fried Rice\"=>3}"
   subject.basket
 end

 it 'displays total' do
   subject.place_an_order("Beef Fried Rice")
   subject.place_an_order("King Prawn Noodles", 3)
   expect(subject.total).to eq "Total is £21.30"
 end

 it 'it checks that total customer has been given matches the total price' do
   subject.place_an_order("Beef Fried Rice")
   subject.place_an_order("King Prawn Noodles", 3)
   subject.total
   expect(subject.correct_price?(21.3)).to be true
 end

end
end

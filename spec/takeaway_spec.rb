require 'takeaway'

describe Takeaway do
  let(:menu) { double :menu, price: 1}
  let(:subject) {described_class.new}

describe '#print_menu' do
  it 'displays a menu' do
    expect(subject.print_menu).to be_a(Hash)
  end

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
    expect(subject.display_basket).to eq "{\"King Prawn Noodles\"=>5}"
    subject.display_basket
  end
  it 'can stores a number of orders' do
    subject.place_an_order("Beef Fried Rice")
    subject.place_an_order("Beef Fried Rice", 2)
    expect(subject.display_basket).to eq "{\"Beef Fried Rice\"=>3}"
    subject.display_basket
  end

  it 'displays total' do
    subject.place_an_order("Beef Fried Rice")
    subject.place_an_order("King Prawn Noodles", 3)
    expect(subject.total).to eq "Total is £21.30"
  end
end

describe '#complete' do

  it "raises an error if total price doesn't match the sum given by customer" do
    subject.place_an_order("Beef Fried Rice")
    subject.place_an_order("King Prawn Noodles", 3)
    expect{subject.complete(22)}.to raise_error "The sum is incorrect"
  end

end



end
end

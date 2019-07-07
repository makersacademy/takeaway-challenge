require 'takeaway'
require 'order'

describe Order do

  it 'creates a new order' do
    expect(subject).to be_instance_of(Order)
  end

  it 'starts with an empty basket' do
    expect(subject.basket).to be_empty
  end

  it 'adds an item to the basket' do
    takeaway_double = double(:takeaway)
    allow(takeaway_double).to receive(:select_item).with(2)
    (subject.add_to_basket(takeaway_double, 2))
    expect(subject.basket).not_to be_empty
  end

  it 'adds two items to the basket' do
    takeaway_double = double(:takeaway)
    allow(takeaway_double).to receive(:select_item).with(2)
    allow(takeaway_double).to receive(:select_item).with(1)
    (subject.add_to_basket(takeaway_double, 2))
    (subject.add_to_basket(takeaway_double, 1))
    expect(subject.basket.length).to eq 2
  end

  it 'prints the current basket' do
    takeaway_double = double(:takeaway)
    allow(takeaway_double).to receive(:select_item).with(2)
    allow(takeaway_double).to receive(:select_item).with(1)
    (subject.add_to_basket(takeaway_double, 2))
    (subject.add_to_basket(takeaway_double, 1))
    expect (subject.print_basket).to eq "Cheeseburger - £5\nFried chicken - £4"
  end

end

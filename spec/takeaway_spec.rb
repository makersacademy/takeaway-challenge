require './lib/takeaway'

describe Takeaway do
  it 'is initialized with a list of dishes it makes' do
    expect(subject.menu).to be_a Array
  end

  it 'builds a menu of dishes' do
    rice = double('rice', :name => 'rice', :price => 3)
    allow(subject).to receive(:menu).and_return([rice])
    expect(subject.menu).to include rice
  end

  it 'allows an order to be initiated' do
    subject.new_order
    expect(subject.order).to be_a Order
  end

  it 'allows an order to be placed' do
    subject.new_order
    subject.place_order
    expect(subject.order.placed?).to eq true
  end

end

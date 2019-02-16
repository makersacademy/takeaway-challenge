require './lib/takeaway'
require './lib/dish'

describe Takeaway do
  it 'has a menu of dishes' do
    rice = double('rice', :name => 'rice', :price => 3)
    allow(subject).to receive(:dishes).and_return([rice])
    expect(subject.dishes).to include rice
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

  pending 'show its menu for browsing' do
    expect(subject.browse_menu).to include 'rice (£3)'
  end

  pending 'it prevents empty orders from being placed'

end

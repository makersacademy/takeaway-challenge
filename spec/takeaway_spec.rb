require 'takeaway'

describe Takeaway do
  let(:menu) { double :menu }
  let(:order) { instance_double('Order', add_to_basket: nil, total: 23.48) }
  subject(:takeaway) { described_class.new(menu, order) }
  let(:dishes) { { pita: 3, musaka: 2 } }
  
  it 'shows the list of dishes and prices' do 
    allow(menu).to receive(:view_menu).and_return ("Garlic bread: £1.99")
    expect(takeaway.show_menu).to eq("Garlic bread: £1.99")
  end

  context '#place_order' do
    let(:another_dish) { double :dish, pizza: 8.50 }

    it { is_expected.to respond_to(:place_order).with(1).argument }

    it 'can select some number of several available dishes' do
      expect(order).to receive(:add_to_basket).twice
      takeaway.place_order(dishes)
    end

    it 'shows the order total' do
      expect(takeaway.place_order(dishes)).to eq(23.48)
    end
  end 
end
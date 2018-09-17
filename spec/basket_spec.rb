require 'basket'

describe Basket do

  it { is_expected.to respond_to(:select_dish).with(1).argument }
  it { is_expected.to respond_to(:order_list) }
  it { is_expected.to respond_to(:complete_order) }
  it 'Should show order total' do
    expect(subject.bill).to eq(0)
  end
  it 'Should return an empty array in testing' do
    expect(subject.order_list).to eq([])
  end

  context '#select_dish' do
    subject(:takeaway_class)      { described_class.new(new_order) }
    let(:new_order)               { double :menu_class, new: menu }
    let(:menu)                    { [{ platter: "Chicken Gyoza 5pcs", price: 4.50 }] }
    let(:platter)                 { 'Chicken Gyoza 5pcs' }

    it "Should send request to menu" do
      allow(new_order).to receive(:dishlection).and_return(menu)
      expect(new_order).to receive(:dishlection).with(platter)
      takeaway_class.select_dish(platter)
    end

    it "Should add order to order final" do
      allow(new_order).to receive(:dishlection).and_return(menu)
      takeaway_class.select_dish(platter)
      expect(takeaway_class.order).to eq(menu)
    end
  end
end

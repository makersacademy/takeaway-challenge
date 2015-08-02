require 'takeaway'

describe Takeaway do

  it { is_expected.to respond_to(:display_menu) }

  it { is_expected.to respond_to(:select_items).with(2).arguments }

  it 'can choose items and quantities from the menu' do
    subject.select_items(:chicken, 1)
    subject.select_items(:beer, 3)
    expect(subject.selection).to include({ Chicken: 1, Beer: 3 })
  end

  it 'can get the price of an item' do
      expect(subject.get_price(:wine)).to eq(7.99)
  end

end

require 'takeaway'

describe Takeaway do

  it { is_expected.to respond_to(:display_menu) }

  it { is_expected.to respond_to(:select_items).with(2).arguments }

  it 'can choose items and quantities from the menu' do
    subject.select_items(:chicken, 1)
    subject.select_items(:beer, 3)
    expect(subject.selection).to include({ chicken: 1, beer: 3 })
  end

  it 'can add multiple of the same item separately' do
    subject.select_items(:chicken, 1)
    subject.select_items(:chicken, 1)
    expect(subject.selection).to include({ chicken: 2 })
  end
  # made private method
  # it 'can get the price of an item' do
  #     expect(subject.get_price(:wine)).to eq(7.99)
  # end

  it 'can calculate the total price of a bill' do
    subject.select_items(:chicken, 1)
    subject.select_items(:kebab, 2)
    expect(subject.total).to eq(12.97)
  end

end

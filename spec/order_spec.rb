require 'order'

describe Order do

  it { is_expected.to respond_to(:my_order).with(0).arguments }
  it { is_expected.to respond_to(:select).with(2).arguments }

  it 'returns a selected item and price' do
    subject.select("Beef Chimichunga", 2)
    expect(Menu::LIST).to include subject.my_order[0]
  end

end

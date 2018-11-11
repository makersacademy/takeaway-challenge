require 'order'

describe Order do

  it { is_expected.to respond_to(:my_order).with(0).arguments }
  it { is_expected.to respond_to(:select).with(1).argument }

  it 'returns a selected item and price' do
    subject.select("Beef Chimichunga")
    expect(subject.menu.list).to include subject.my_order[0]
  end

end

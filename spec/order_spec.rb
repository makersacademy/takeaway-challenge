require 'order'

describe Order do
  it 'exists!' do
    expect(subject.class).to eq Order
  end

  it { is_expected.to respond_to(:place_order).with(2).arguments }

end

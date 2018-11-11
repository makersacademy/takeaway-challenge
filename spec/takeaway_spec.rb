require 'takeaway'

describe Takeaway do

  it { is_expected.to respond_to(:menu).with(0).arguments }
  it { is_expected.to respond_to(:order).with(0).arguments }
  it { is_expected.to respond_to(:view_menu).with(0).arguments }
  it { is_expected.to respond_to(:select).with(2).arguments }

  describe '#view_menu' do

    it 'should return a list of items & prices' do
      expect(subject.view_menu).to eq subject.menu.view
    end

  end

  describe '#select(item)' do

    it 'should add an item to the current order' do
      item = "Mixed Fajita"
      expect(subject.select(item, 2)).to eq subject.order.select(item, 2)
    end

  end

end

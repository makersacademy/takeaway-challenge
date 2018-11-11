require 'order'

describe Order do

  it { is_expected.to respond_to(:my_order).with(0).arguments }
  it { is_expected.to respond_to(:select).with(2).arguments }

  describe '#select' do

    it 'returns a selected item and price' do
      subject.select("Beef Chimichunga", 2)
      expect(Menu::LIST).to include subject.my_order[0]
    end

  end

  describe '#check_total' do

    it 'should return the correct total for my_order' do
      subject.select("Mixed Fajita", 5)
      expect(subject.check_total).to eq 45
    end

  end

end

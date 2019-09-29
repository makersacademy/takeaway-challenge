require 'takeaway'

describe Takeaway do

  it 'exists!' do
    expect(subject.class).to eq Takeaway
  end

  it 'has an empty for customer orders when initialized' do
    expect(subject.customer_order).to eq []
  end

  it { is_expected.to respond_to(:list_dishes) }

  describe '#list_dishes' do
    it 'lists menu items' do
      expect(subject.list_dishes).to eq MENU_ITEMS
    end
  end

  it { is_expected.to respond_to(:make_order).with(2).arguments }

  describe '#make_order' do
    it 'stores an order' do
      subject.make_order(5, 5)
      expect(subject.customer_order).to include({ :itemnum => 5, :quantity => 5 })
    end
  end
end

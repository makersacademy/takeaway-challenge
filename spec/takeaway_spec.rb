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
    it "throws and error if the item ordered doesn't exist" do
      message = "Sorry, that's not on the menu"
      expect { subject.make_order('Pigs feet', 3) }.to raise_error message
    end

    it 'stores an order' do
      subject.make_order('Prairie Oysters', 5)
      expect(subject.customer_order).to include({ :item => 'Prairie Oysters', :quantity => 5 })
    end
  end

  it { is_expected.to respond_to(:checkout).with(1).arguments }

  describe '#checkout' do
    it 'throws an error if there is no order' do
      message = "No orders"
      expect { subject.checkout(:payment) }.to raise_error message
    end
  end
end

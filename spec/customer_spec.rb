require 'customer'

describe Customer do

  it 'should have an order that is a hash' do
    expect(subject.order.class).to eq Hash
  end

  describe 'check_menu' do
    it { is_expected.to respond_to(:check_menu).with(1).argument}
  end



  describe 'add_to_order' do
    it 'responds to order' do
      m = double :menu
      expect(subject).to respond_to(:add_to_order).with(3).arguments
    end

    it 'should add new items to order' do
      m = double :menu, items: {burger: 10, pizza: 8, soup: 7}
      subject.add_to_order(m,'burger',2)
      expect(subject.order[:burger]).to eq [2,10]
    end
  end
end

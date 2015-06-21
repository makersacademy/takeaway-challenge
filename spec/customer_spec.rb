require 'customer'

describe Customer do

  before(:each) do
    @order = {}
    @total = 0
  end

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

    it 'should update the quantity of items already in order' do
      m = double :menu, items: {burger: 10, pizza: 8, soup: 7}
      subject.add_to_order(m,'burger',2)
      subject.add_to_order(m,'burger',3)
      expect(subject.order[:burger]).to eq [5,10]
    end

    it "should update the customer's total price" do
      m = double :menu, items: {burger: 10, pizza: 8, soup: 7}
      subject.add_to_order(m,'burger',2)
      subject.add_to_order(m,'pizza',3)
      expect(subject.total_price).to eq 44
    end

    it "should update the customer's total quantity" do
      m = double :menu, items: {burger: 10, pizza: 8, soup: 7}
      subject.add_to_order(m,'burger',2)
      subject.add_to_order(m,'pizza',3)
      expect(subject.total_quantity).to eq 5
    end
  end

  describe 'place order' do
    it 'should not place order if total is miscalculated' do
      m = double :menu, items: {burger: 10, pizza: 8, soup: 7}
      subject.add_to_order(m,'burger',2)
      subject.add_to_order(m,'pizza',3)
      subject.total_price = 0
      expect{subject.place_order}.to raise_error "Total price miscalculation"
    end

    it 'should send a message to customer' do
      m = double :menu, items: {burger: 10, pizza: 8, soup: 7}
      subject.add_to_order(m,'burger',2)
      subject.add_to_order(m,'pizza',3)
    expect(subject.place_order).to raise_error "Total price miscalculation"
  end



end

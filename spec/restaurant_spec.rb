require 'restaurant'

describe Restaurant do
  subject = Restaurant.new
  it { is_expected.to respond_to :view_menu}
  it { is_expected.to respond_to :welcome}
  it { is_expected.to respond_to :menu}
  it { is_expected.to respond_to :place_order}
  it { is_expected.to respond_to :order}
  it { is_expected.to respond_to :customer_order}
  it { is_expected.to respond_to :bill}



describe '#welcome' do
  context 'when a customers comes to restaurant application' do
    it 'welcomes them' do
      expect{subject.welcome}.to output("Welcome to the Thai Cottage\n").to_stdout
    end
  end
end

describe '#view_menu' do
  context 'when customer asks for a menu' do
    it 'creates a menu for the customer to view' do
      subject.view_menu
      expect(subject.menu).to be_instance_of(Menu)
    end
  end
end

describe '#place_order' do
  context 'when customer wants to order' do
    it 'creates an order' do
      subject.place_order
      expect(subject.order).to be_instance_of(Order)
    end
  end

  it 'returns customers order into an array' do
    order = Order.new
    allow(order).to receive(:customer_order).and_return(["PhadThai", "SpringRolls"])
    subject.place_order
    expect(subject.customer_order).to be_an(Array)
  end
end

  describe '#order_value' do
    let(:customer_order) {double = :customer_order, "PhadThai", "SpringRolls"}
    context 'when customer has ordered' do
      it 'creates a total value summary' do
        expect(subject.total_value).not_to be_nil
      end
    end
end


end

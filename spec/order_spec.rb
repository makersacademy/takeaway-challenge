require 'order'

describe Order do

  subject { described_class.new }

  let(:dishes) { { burger: 2, hamburger: 1,} }

  it 'can order dishes from the menu' do
    subject.add_order(:burger, 2)
    subject.add_order(:hamburger, 1)
    expect(subject.dishes).to eq(dishes)
  end

  context 'it raises an error' do
    it 'when dish not on the menu' do
      expect { subject.add_order("beef", 2) }.to raise_error "Beef is not on the menu!"
    end
  end

  describe '#order_total' do
    it 'returns the order total in pounds' do
      subject.add_order(:burger, 1)
      subject.add_order(:hamburger, 1)
      expect(subject.order_total).to eq("£14")
    end
  end
end

require 'order'

describe Order do

  subject { described_class.new }

  let(:dishes) { { burger: 2, hamburger: 1,} }

  it 'can order dishes from the menu' do
    subject.add_order(:burger, 2)
    subject.add_order(:hamburger, 1)
    expect(subject.dishes).to eq(dishes)
  end

  context 'it raises an error'
  it 'when dish not on the menu' do
    expect { subject.add_order("beef", 2) }.to raise_error "Beef is not on the menu!"
  end
end

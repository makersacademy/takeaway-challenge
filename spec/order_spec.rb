require 'order'

describe Order do

  subject { described_class.new(menu) }

  let(:dishes) { { burger: 2, hamburger: 1,} }

  let(:menu) { double(:menu) }

  before do
    allow(menu).to receive(:has_dish?).with(:burger).and_return(true)
    allow(menu).to receive(:has_dish?).with(:hamburger).and_return(true)
  end

  it 'can order dishes from the menu' do
    subject.add_order(:burger, 2)
    subject.add_order(:hamburger, 1)
    expect(subject.dishes).to eq(dishes)
  end

  it 'raises and error when dish not on the menu' do
    allow(menu).to receive(:has_dish?).with(:beef).and_return(false)
    expect { subject.add_order(:beef, 2) }.to raise_error "Beef is not on the menu!"
  end
end

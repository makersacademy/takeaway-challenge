require 'menu'

describe Menu do
  let(:menu) { double :menu }
  subject(:cust){described_class.new}
  it 'initializes with a list of dishes' do
    expect(subject.menu).to eq('Fish&Chips' => 3, 'Burger&Chips' => 5)
  end
end

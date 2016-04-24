require 'menu'

describe Menu do
  let(:menu) { described_class.new }
  let(:items) do {
    'chicken jalfrezi' => 7.99,
    'onion bhaji' => 3.99,
    'naan' => 2.99,
    'rice' => 1.99
    } end

  it 'creates a menu' do
    expect(menu.show_menu).to eq items
  end

end

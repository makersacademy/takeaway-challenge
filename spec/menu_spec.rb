require 'menu'

RSpec.describe Menu do
  let(:dishes) { { "Classic Chicken": 8.85 } }

  subject(:menu) { described_class.new(dishes) }

  it 'prints the menu' do
    expect(menu.print_menu).to eq dishes
  end
end

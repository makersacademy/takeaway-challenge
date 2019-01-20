require 'menu'

RSpec.describe Menu do
  subject(:menu) { described_class.new(dishes) }

  let(:dishes) { { "Classic Chicken": 8.85 } }
  let(:printed_menu) { "Classic Chicken £8.85" }

  it 'prints the menu' do
    expect(menu.print_menu).to eq printed_menu
  end
end

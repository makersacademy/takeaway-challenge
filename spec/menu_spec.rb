require 'menu'

describe Menu do
  subject(:menu) { described_class.new }

  it 'holds a menu' do
    expect(menu.show).to include('chips' => '£1', 'oreos' => '£3', 'milkshake' => '£2')
  end
end

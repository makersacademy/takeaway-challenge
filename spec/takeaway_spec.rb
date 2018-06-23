require './lib/takeaway'
require './lib/menu'

describe Takeaway do
  let(:menu) { double Menu.new }

  it 'prints menu on inititalize' do
    allow(menu).to receive(:price_list).and_return('a menu')
    takeaway = Takeaway.new(menu)
    expect(takeaway.print_menu).to eq('a menu')
  end
end

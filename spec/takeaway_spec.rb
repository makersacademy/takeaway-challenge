require 'takeaway'

describe Takeaway do
  subject(:takeaway) { described_class.new(menu: menu)}

let(:menu) { double(:menu, print: show_menu) }
let(:show_menu) { 'Menu' }

  it 'shows Menu' do
    expect(takeaway.show_menu).to eq('Menu')
    end

end

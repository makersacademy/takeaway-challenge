require 'takeaway'

describe Takeaway do
  subject(:takeaway) { Takeaway.new(menu: menu) }

  let(:menu) { double :menu, show: printed_menu }
  let(:printed_menu) { 'Doner Kebab £4.50' }

  it 'shows the takeaway menu' do
    expect(takeaway.show_menu).to eq printed_menu
  end


end

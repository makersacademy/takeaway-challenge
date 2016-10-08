require 'takeaway'

describe Takeaway do
  subject(:takeaway) { Takeaway.new }
  let(:menu) { "Doner Kebab: £4.00"}
  it 'shows the takeaway menu' do
    expect(takeaway.show_menu).to eq (menu)
  end


end

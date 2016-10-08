require 'takeaway'

describe Takeaway do
  subject(:takeaway) { Takeaway.new }

  it 'shows the takeaway menu' do
    expect(takeaway.show_menu).to eq ("Doner Kebab: £4.00")
  end


end

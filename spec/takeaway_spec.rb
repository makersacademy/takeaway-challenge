require 'takeaway'

describe Takeaway do
  subject(:takeaway) { Takeaway.new }
  it 'shows the menu' do
    expect(takeaway.show_menu).to include :burger => 5
  end
end

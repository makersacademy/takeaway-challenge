require 'takeaway'

describe Takeaway do

  subject(:takeaway) { described_class.new }

  it 'has a menu' do
    expect(takeaway.menu).to be_a Menu
  end

  it 'can view a menu' do
    expect(takeaway.read_menu(menu)).to eq menu
  end

end

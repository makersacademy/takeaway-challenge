require 'takeaway'

describe Takeaway do
  subject(:takeaway) { described_class.new }

  it 'shows a menu with dishes and their prices' do
    expect(takeaway.show_menu).to eq "Swedish Meatballs - £2.50"
  end
end

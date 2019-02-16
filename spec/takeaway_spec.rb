require 'takeaway'

describe Takeaway do

  subject(:takeaway) { described_class.new }

  it 'allows me to view a menu' do
    expect(subject.view_menu).to eq(["Chicken £3.50", "Pizza £4"])
  end

end

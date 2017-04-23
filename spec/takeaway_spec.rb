require 'takeaway'

describe Takeaway do
  subject(:takeaway) { described_class.new }
  it 'displays a list of dishes with prices' do
    expect(takeaway.see_menu).to eq(Takeaway::MENU)
  end
end

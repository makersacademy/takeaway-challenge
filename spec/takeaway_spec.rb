require 'takeaway'

describe Takeaway do
  subject(:takeaway) { described_class.new }

describe '#menu' do
  it 'brings up list of dishes with prices' do
    expect(takeaway.menu).not_to be_empty
  end

end
end

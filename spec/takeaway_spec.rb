require 'takeaway'

describe Takeaway do
  subject(:takeaway) { described_class.new }
  it {is_expected.to respond_to(:menu)}
  xit 'should display a list of dishes with prices' do

  end
end

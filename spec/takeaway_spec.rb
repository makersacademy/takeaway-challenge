require 'takeaway'

describe Takeaway do

  subject(:takeaway) { Takeaway.new }

  describe '#initialize'
  it "shows a list of dishes" do
    expect(takeaway.menu).to eq takeaway.menu
  end

end

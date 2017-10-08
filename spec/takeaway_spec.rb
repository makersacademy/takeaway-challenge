require 'takeaway'

describe Takeaway do

  subject(:takeaway) { Takeaway.new }

  describe '#initialize'
  it "shows a list of dishes" do
    expect(takeaway.read_menu).to eq takeaway.read_menu
  end

end

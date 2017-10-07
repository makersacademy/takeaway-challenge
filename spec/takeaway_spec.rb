require 'takeaway.rb'

describe Takeaway do
  subject(:takeaway) {described_class.new}

  it "has a list of dishes" do
    expect(takeaway.menu).to be_empty
  end

end

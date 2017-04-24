require "takeaway"

describe Takeaway do
  subject(:takeaway) { described_class.new }

  it "can see a list of dishes with prices" do
    expect(takeaway.check_menu).to eq(1)
  end
end

require "takeaway"

describe Takeaway do

  let(:takeaway) { described_class.new }

  it "checks that the takeaway menu exists" do
    expect(takeaway).to respond_to(:menu)
  end

end

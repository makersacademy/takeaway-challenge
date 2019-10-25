require "takeaway"

describe Takeaway do
  let(:takeaway) { Takeaway.new }
  it "has a instance of Takeaway class" do
    expect(takeaway).to be_instance_of(Takeaway)
  end
end

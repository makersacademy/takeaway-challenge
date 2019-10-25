require "takeaway"
require "dish"
describe Takeaway do
  let(:takeaway) { Takeaway.new }
  it "has a instance of Takeaway class" do
    expect(takeaway).to be_instance_of(Takeaway)
  end

  it "allows users to select a dish" do
    takeaway.select_dishes("pizza")
    expect(takeaway.order).not_to be_empty
  end
end

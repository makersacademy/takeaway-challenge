require "takeaway"
require "dish"
describe Takeaway do
  let(:takeaway) { Takeaway.new }
  it "has a instance of Takeaway class" do
    expect(takeaway).to be_instance_of(Takeaway)
  end

  #it "displays available dishes" do
  #  p @dishes
  # expect(takeaway.display_dishes).to eq 5
  #end

  it "allows users to select a dish" do
    takeaway.select_dishes("pizza")
    expect(takeaway.order).not_to be_empty
  end
end

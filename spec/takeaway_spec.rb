require 'takeaway'
describe Takeaway do
  subject { Takeaway.new }
    # As a customer
    # So that I can check if I want to order something
    # I would like to see a list of dishes with prices
  describe "#initialize" do
    it "empty menu array" do
    expect(subject.menu).to eq []
    end
  end

end

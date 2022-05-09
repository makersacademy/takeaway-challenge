require_relative '../lib/takeaway.rb'

describe TakeAway do
  subject(:takeaway) { described_class.new }

  context "The Takeaway" do
    it "creates a new takeaway" do
      expect(takeaway).to be_a_kind_of TakeAway
    end
  end
  
end

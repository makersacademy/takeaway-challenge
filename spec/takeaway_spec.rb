require_relative '../lib/takeaway.rb'

describe TakeAway do
  subject(:takeaway) { described_class.new }

  let(:dishes) do
    {
      hotdog: 5.00,
      fries: 3.50
    }
  end

  let(:order) do
    {
      hotdog: 2,
      fries: 1
    }
  end

  context "The Takeaway" do
    it "creates a new takeaway" do
      expect(takeaway).to be_a_kind_of TakeAway
    end
  end

  context "The Menu" do

  end

  context "The Order" do

  end

end

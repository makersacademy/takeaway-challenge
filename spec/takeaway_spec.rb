require 'takeaway'

describe Takeaway do
  subject(:takeaway) { described_class.new }

  describe "showing dishes" do
    it 'is initialsed with a meals list' do
      expect(takeaway.menu).to be_empty
    end

    it 'returns the menu list' do
      expect(takeaway.menu).to eq []
    end

  end

end

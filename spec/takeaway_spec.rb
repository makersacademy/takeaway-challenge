require 'takeaway'

describe Takeaway do
  subject(:takeaway) { described_class.new }
  let(:name) { double(:name) }
  let(:price) { double(:price) }

  describe "showing dishes" do
    it 'is initialsed with a meals list' do
      expect(takeaway.menu).to be_empty
    end

    it 'returns the menu list' do
      expect(takeaway.menu).to include({ name: name, price: "£#{price}" })
    end

  end

end

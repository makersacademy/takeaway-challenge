require 'takeaway'

describe TakeAway do
  subject(:takeaway) { described_class.new }

  describe '#initialize' do
    it 'has an empty basket' do
      expect(takeaway.basket).to be_empty
    end
  end
end

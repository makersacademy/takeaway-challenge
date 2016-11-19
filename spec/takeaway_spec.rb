require 'takeaway'
  describe Takeaway do
    subject(:takeaway) { described_class.new }

    it 'should initialize with an empty order hash' do
      expect(takeaway.order).to be_empty
    end
end

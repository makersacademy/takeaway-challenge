require 'order'

describe Order do
    subject(:order) {described_class.new}
  describe '#initialize' do

    it "it initializes with an empty order" do
      expect(subject.order).to be_empty
    end

  end
end
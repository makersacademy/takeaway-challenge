require 'takeaway'

describe Takeaway do

  let(:shop) { described_class.new }

  describe '#list' do

    it "produces a menu" do
      expect(shop).to respond_to(:menu)
    end

  end

end

require 'takeaway'

describe Takeaway do
  subject(:takeaway) { described_class.new }

  let(:menu) {double(:menu)}




  describe '#add_order' do
    it 'adds order to list' do
      takeaway.add_order("Lasagna", 3)
      expect(takeaway.order.items).to include ( {name: "Lasagna", price: "£10"} )
    end
  end



end

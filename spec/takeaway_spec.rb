require 'takeaway'

describe Takeaway do
  subject(:takeaway) { described_class.new }
  let(:menu) {double(:menu)}

  describe '#gets_input' do

  end

  describe '#save_input' do
    it 'saves inputs in order' do
      takeaway.save_input('lasagna', 2)
      expect(order.items). to eq [{'lasagna' => 10, 'lasagna' => 10}]
    end
  end 



end

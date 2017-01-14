require 'takeaway'

describe Takeaway do

  context 'Menu' do
  let(:takeaway) { described_class.new }

    it 'Should be able to call #read_menu method from Menu' do
      expect(takeaway).to respond_to(:read_menu)
    end
  end

end

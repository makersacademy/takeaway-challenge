require 'takeaway'

describe Takeaway do
  let(:menu) {double(:menu)}
  subject(:takeaway) {described_class.new(menu)}

  context 'reading a menu' do
    it 'can access the menu' do
      expect(takeaway.menu).to eq menu
    end
  end
end
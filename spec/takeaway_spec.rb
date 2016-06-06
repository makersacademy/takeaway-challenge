require 'takeaway'

describe Takeaway do

  subject(:takeaway) {described_class.new(menu)}
  let(:menu) {double :menu}
  let(:order) {double :order}

  describe '#menu' do
    it 'allows customers to view menu' do
      expect(menu).to receive(:show_menu)
      takeaway.menu
    end
  end


end

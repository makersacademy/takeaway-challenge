require 'takeaway'

RSpec.describe Takeaway do

  let(:menu) { double :menu, display_menu: {} }
  subject { described_class.new }

  describe 'read_menu method' do
    it 'returns the menu' do
      allow(menu).to receive(:display_menu).and_return({})
      subject.read_menu
    end
  end
end

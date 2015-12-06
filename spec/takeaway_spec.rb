require 'takeaway'

describe Takeaway do
  subject(:takeaway) { described_class.new }
  let(:menu) { double(:menu, contents: contents) }
  describe '#read_menu' do
    it 'lists the items on the menu' do
      expect(takeaway.read_menu).to include(menu.contents)
    end
  end
end

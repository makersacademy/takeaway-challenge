require 'takeaway'
describe Takeaway do
  let(:takeaway) { Takeaway.new(menu) }
  let(:menu) { double(:menu, list_menu: output) }
  let(:output) { 'california roll --- £9, fried chicken --- £7' }

  describe '#list_menu' do
    it 'should print out a list of menu items' do
      expect(takeaway.list_menu).to eq(output)
    end
  end
end

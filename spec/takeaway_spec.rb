require 'takeaway'
require 'menu'

describe Takeaway do

  let(:menu) { double :menu }
  subject(:takeaway) { described_class.new(menu) }
  
  describe '#view_menu' do  
    it 'should display the menu' do
      expect(subject.view_menu).to eq(:menu.display)
    end  
  end

end
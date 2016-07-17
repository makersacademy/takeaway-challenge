require 'takeaway'

describe Takeaway do

  subject(:takeaway) {described_class.new}

  describe 'initialize' do
    it 'loads the menu' do
      expect(Menu).to receive (:new)
      takeaway
    end
  end


  describe '#show menu' do
    it 'displays the menu' do
      expect(takeaway.menu).to receive (:list)
      takeaway.show_menu
    end
  end

end

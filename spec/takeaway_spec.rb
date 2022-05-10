require 'takeaway'

describe Takeaway do 
  subject { Takeaway.new(restaurant) }
  let(:restaurant) { 'Bamboo kitchen' }
  context 'When initialized' do 
    it 'has a name' do 
      expect(subject.name).to eq 'Bamboo kitchen'
    end
    it 'has a menu' do 
      expect(subject.see_menu).not_to be_empty
    end
  end

  describe '#see_menu' do 
    it 'prints the full list of menu item' do 
      expect(subject.see_menu.count).to eq subject.menu.size
    end
  end
end

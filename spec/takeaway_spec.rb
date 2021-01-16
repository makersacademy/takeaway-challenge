require 'takeaway'

describe Takeaway do 
  context '#menu' do
    it '#see_menu should return the menu' do 
      expect(subject.see_menu).to eq subject.menu
    end

    it 'should be an array' do 
      expect(subject.menu).to be_a Array
    end

    it 'should include hashes' do 
      expect(subject.menu).to include Hash
    end

    it 'should have individual dishes as hashes' do 
      expect(subject.menu[-1]).to be_a Hash
    end

  end
end

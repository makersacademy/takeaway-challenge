require 'menu'

describe Menu do 

  context '#menu' do
    it 'should be an array' do 
      expect(subject.menu).to be_a Array
    end

    it 'should include hashes' do 
      expect(subject.menu).to include Hash
    end

    it 'should have individual dishes as hashes' do 
      expect(subject.menu[-2]).to be_a Hash
    end

  end

end
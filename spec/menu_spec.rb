require 'menu'
describe Menu do
  describe '#menu' do	
    it 'returns a menu' do
      expect(subject.menu).to be_an_instance_of(Hash)	
    end
  end      
end
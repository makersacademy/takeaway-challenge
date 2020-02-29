require 'menu'
describe Menu do
  describe '#list' do
    it 'list of dishes' do
      expect(subject.list).to eq subject.dishes
    end
  end
  describe '#price' do
    it 'gets price for particular dish' do
      expect(subject.price('egg roll')).to eq(subject.dishes['egg roll'])
    end
  end
  describe '#is_available' do
    it 'checking availability of dish when its available' do
      expect(subject.available?('egg roll')).to eq true
    end
    it 'checking availability of dish when its not available' do
      expect(subject.available?('chicken')).to eq false
    end
  end
end

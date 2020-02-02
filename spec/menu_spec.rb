require 'menu'

describe Menu do

  describe '#dishes' do
    it 'gets dishes from list of dishes' do
      expect(subject.dishes).to eq([])
    end
  end
end

require 'menu'

describe Menu do

  describe '#getdishes' do
    it 'gets dishes from list of dishes' do
      expect(subject.getdishes).to eq([])
    end
  end
end

require 'menu'

describe Menu do 

  describe '#list' do
    it 'contains a list of dishes' do
      expect(subject.list).to_not be_empty
    end
    # need to replace Sushi with a mock
    it 'contains prices with positive integers' do
      expect(subject.list['Sushi']).to be > 0
    end 
  end
end

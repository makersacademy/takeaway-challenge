require 'takeaway'

describe Menu do 
  describe '#lists' do
    it 'contains a list of dishes' do
      expect(subject.list).to_not be_empty
    end

    #need to replace Sushi with a mock
    it 'contains a hash with values' do
      expect(subject.list['Sushi']).to be > 0
    end 
  end 
end 
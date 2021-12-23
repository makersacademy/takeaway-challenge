require 'takeaway'

describe Menu do 
  describe '#lists' do
    it 'contains a list of dishes and prices' do
      expect(subject.list).to_not be_empty
    end 
  end 
end 
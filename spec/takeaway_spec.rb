require 'takeaway'

describe Menu do 


  describe '#list' do
    it 'contains a list of dishes' do
      expect(subject.list).to_not be_empty
    end
    #need to replace Sushi with a mock
    it 'contains a price with positive integers' do
      expect(subject.list['Sushi']).to be > 0
    end 
  end

  describe '#add' do
    it { is_expected.to respond_to(:add) }

    it 'adds an item to the order_list' do 
      subject.add("Sushi")
      expect(subject.add("Kim Chi").count).to change(@order_list).by(1) 
      
    end 
    #build a test which increases the 
    #order_list by 1 after add

  end 
end 
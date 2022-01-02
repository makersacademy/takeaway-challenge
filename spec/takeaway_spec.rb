require 'takeaway'

describe Menu do 


  describe '#list' do
    it 'contains a list of dishes' do
      expect(subject.list).to_not be_empty
    end
    #need to replace Sushi with a mock
    it 'contains prices with positive integers' do
      expect(subject.list['Sushi']).to be > 0
    end 
  end

  describe '#add' do
    it { is_expected.to respond_to(:add) }

    it 'increases the order_list by 1' do
      expect{subject.add("Kim Chi")}.to change{subject.order_list.count}.by(1) 
    end 
    #build a test which increases the 
    #order_list by 1 after add
  end 

  describe '#sum' do 
    it 'adds the total in order_list' do 
      subject.add("Sushi")
      subject.add("Kim Chi")
      expect(subject.total).to eq(9)
    end 
  end 
end 
require 'takeaway'

describe Takeaway do 

  context '#view_dishes' do
    it 'responds to takeaway object' do
      expect(subject).to respond_to(:view_dishes)
    end

    it 'returns list of dishes with prices' do 
      expect(subject.view_dishes).to eq({ chips: 2 })
    end
  end
end

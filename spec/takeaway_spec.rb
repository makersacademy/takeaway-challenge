require 'takeaway'

describe Takeaway do 

  context '#view_dishes' do
    it { is_expected.to respond_to(:view_dishes)}

    it 'returns list of dishes with prices' do 
      expect(subject.view_dishes).to eq({ chips: 2 })
    end
  end
end

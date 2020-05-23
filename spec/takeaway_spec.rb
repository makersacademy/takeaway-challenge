require 'takeaway'

describe Takeaway do 

  let(:takeaway_dishes) { {1 => "chips", 2 => "cheese burger", 3 => "chicken wings"} }
  context '#view_dishes' do
    it { is_expected.to respond_to(:view_dishes)}

    it 'returns list of dishes with prices' do 
      expect(subject.view_dishes).to eq(takeaway_dishes)
    end
  end
end

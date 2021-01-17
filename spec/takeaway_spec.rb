require 'takeaway'

describe Takeaway do
  let(:menu) {double}

  describe '#basket' do
    it "should have an empty basket" do 
     expect(subject.basket).to eq Hash.new
    end
  end



end

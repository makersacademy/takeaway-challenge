require 'takeaway'
describe Takeaway do
  subject (:takeaway) { described_class.new }

  let (:menu) { [{ :breadfruit => 8 }, { :macaroni => 3 }, 
    { :plantain => 2 }, { :avocado => 4 }, 
    { :salad => 5 }, { :jackfruit => 3 }]
  }

  it { is_expected.to respond_to(:menu) }

  describe '#menu' do

    it 'should list the dishes and prices' do 
      expect(takeaway.menu).to eq menu
    end 

  end
end

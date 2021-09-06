require 'takeaway'
describe Takeaway do
  subject (:takeaway) { described_class.new }
  
  let (:menu) do 
    [
      { dish: 'breadfruit', price: 8.00 },
      { dish: 'macaroni', price: 3.00 },
      { dish: 'plantain', price: 2.00 }, 
      { dish: 'avocado', price: 4.00 }, 
      { dish: 'salad', price: 5.00 }
    ] 
  end

  it { is_expected.to respond_to(:menu) }

  describe '#menu' do
  
    it 'should list the dishes and prices' do 
      expect(takeaway.menu).to eq menu
    end 

  end
end

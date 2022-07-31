require 'takeaway'
describe Takeaway do
    subject(:takeaway) { described_class.new }
   
    let(:menu) do 
        {
            pizza: 10,
            pasta: 8,
            salad: 5
        }
    end

    it "has a menu" do
        expect(takeaway).to respond_to(:menu)
    end

    it 'presents a list of dishes with prices' do
        expect(takeaway.dishes).to include :pizza
      end

    it 'allows users to select how many dishes' do
        test_order = { piza: 1, pasta: 2 }
        takeaway.select(:piza, 1)
        takeaway.select(:pasta, 2)
        expect(takeaway.order).to eq test_order
      end

end
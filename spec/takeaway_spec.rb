require 'takeaway'
describe Takeaway do
    subject(:takeaway) { described_class.new }

    it "has a menu" do
        expect(takeaway).to respond_to(:menu)
    end

    it 'presents a list of dishes with prices' do
        expect(takeaway.dishes).to include :pizza
      end


end
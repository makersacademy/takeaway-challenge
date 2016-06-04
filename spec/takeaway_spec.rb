require 'takeaway'
describe Takeaway do
    subject(:takeaway) {described_class.new}
    describe "#menu" do
        it "prints a list of dishes with prices" do
            expect(takeaway).to respond_to(:menu)
        end
    end
end
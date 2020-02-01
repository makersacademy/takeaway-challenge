require "food"
describe Food do
    describe "#name + #price" do
        it "should expose name and price information" do
            subject = Food.new("Teriyaki", 7)
            expect(subject.name).to eq("Teriyaki")
            expect(subject.price).to eq(7)
        end
    end
end


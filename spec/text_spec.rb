require 'text'

describe Text do

  let(:defined_time) { described_class.new(4) }

  describe "Instatiation" do
    context "upon instantiation" do
      it "should be an instance of class Text" do
        expect(subject).to be_an_instance_of(Text)
      end
    end
  end

  describe "#time" do
    context "when sending message" do
      it "should return the time as 4" do
        expect(defined_time.time).to eq(4)
      end
    end
  end
end

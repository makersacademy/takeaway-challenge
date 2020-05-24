require_relative '../lib/formatter.rb'

describe Formatter do
  describe '#format' do
    it "returns '£x.xx' string when given an number" do
      expect(subject.price(3.76)).to eq("£3.76")
    end
    it "returns '£x.xx' string when given an number" do
      expect(subject.price(1)).to eq("£1.00")
    end
  end

end

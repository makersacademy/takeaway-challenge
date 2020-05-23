require_relative '../lib/formatter.rb'

describe Formatter do
  describe '#format' do
    it "returns '£x.xx' string when given an number" do
      expect(subject.format(3.76)).to eq("£3.76")
    end
  end

end

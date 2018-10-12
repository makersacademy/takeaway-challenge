require "formatmenu"

describe FormatMenu do

  describe '#format_price' do

    it "should convert 4 to £4.00" do
      expect(subject.format_price(4)).to eq("£4.00")
    end

    it "should convert 5.5 to £5.50" do
      expect(subject.format_price(5.5)).to eq("£5.50")
    end

  end

end

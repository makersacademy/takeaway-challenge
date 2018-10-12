require "formatmenu"

describe FormatMenu do

  let(:menu) { double :menu, items: [{dish: "burger", price: 4},
    {dish: "cheeseburger", price: 5}] }

  describe '#initialize' do

    it "should create a header" do
      expect(subject.header).to eq("Mel's Place")
    end

    it "should create a footer" do
      expect(subject.footer).to eq("Hope you enjoy!")
    end

  end

  describe '#format_price' do

    it "should convert 4 to £4.00" do
      expect(subject.format_price(4)).to eq("£4.00")
    end

    it "should convert 5.5 to £5.50" do
      expect(subject.format_price(5.5)).to eq("£5.50")
    end

  end

  describe '#format_menu' do

    it "should show a menu" do
      expect{subject.format_menu(menu.items)}.to output("Mel's Place\n--------------------\nBurger - £4.00\nCheeseburger - £5.00\n--------------------\nHope you enjoy!\n").to_stdout
    end

  end

end

require_relative '../lib/menu.rb'

describe Menu do
  let(:name1) {double(:item1)}
  let(:name2) {double(:item2)}
  let(:name3) {double(:item3)}
  let(:formatter) {double(:formatter)}
  let(:menu) {Menu.new([name1, name2], formatter)}

  before do
    allow(name1).to receive(:name) {"name1"}
    allow(name2).to receive(:name) {"name2"}
    allow(name3).to receive(:name) {"name3"}
    allow(name1).to receive(:price) {1}
    allow(name2).to receive(:price) {1.5}
    allow(formatter).to receive(:format).with(1).and_return("£1.00")
    allow(formatter).to receive(:format).with(1.5).and_return("£1.50")
  end

  describe '#show_dishes' do
    it "should out put the list of available dishes" do
      list = "name1: £1.00\nname2: £1.50\n"
      expect { menu.show_dishes }.to output(list).to_stdout
    end
  end

  describe '#check(item.name)' do
    it "should check the dish is on the menu (true)" do ## will need to be updated when later classes are made
      expect(menu.check(name1.name)).to eq(true)
    end
    it "should check the dish is on the menu (false)" do ## will need to be updated when later classes are made
      expect(menu.check(name3.name)).to eq(false)
    end
  end

  describe '#select(item)' do
    it 'should return the Item' do
      expect(menu.select("name1")).to eq([name1])
    end
  end
end

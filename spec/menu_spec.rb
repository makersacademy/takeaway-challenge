require_relative '../lib/menu.rb'

describe Menu do
  let(:name1) {double(:item1)}
  let(:name2) {double(:item2)}
  let(:menu) {Menu.new(name1, name2)}

  before do
    menu = Menu.new(name1, name2)
    allow(name1).to receive(:name) {"name1"}
    allow(name2).to receive(:name) {"name2"}
    allow(name1).to receive(:price) {"£1.00"}
    allow(name2).to receive(:price) {"£1.50"}
  end

  describe '#show_dishes' do
    it "should out put the list of available dishes" do
      list = "name1: £1.00\nname2: £1.50\n"
      expect { menu.show_dishes }.to output(list).to_stdout
    end
  end

  describe '#check(item)' do
    it "should check the dish is on the menu (true)" do ## will need to be updated when later classes are made
      expect(menu.check("name1")).to eq(true)
    end
    it "should check the dish is on the menu (false)" do ## will need to be updated when later classes are made
      expect(menu.check("name3")).to eq(false)
    end
  end
end

require "menu.rb"

describe Menu do

  describe "#initialize" do
    it "creates an instance of a menu" do
      expect(subject).to be_an_instance_of(Menu)
    end
    it "creates a list on initialize" do
      expect(subject.list).to eq([])
    end
  end
  describe '#add' do
    it "adds a dish to the list with a price and name" do
      subject.add("Fish",1.20)
      expect(subject.list).to eq([{:name => "Fish", :price => 1.20}])
    end
  end
end
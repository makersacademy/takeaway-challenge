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
      expect(subject.list[0][:name]).to eq("Fish")
    end
  end

  describe '#unavailable' do
    it 'adds an item as default available' do
      subject.add("Fish",1.20)
      expect(subject.list[0][:available]).to eq("true")
    end
    it 'makes an item unavailable' do
      subject.add("Fish",1.20)
      subject.unavailable(1)
      expect(subject.list[0][:available]).to eq("false")
    end
  end

  describe '#display' do
    it 'displays the available items first as a list' do
      subject.add("Fish",1.20)
      subject.add("Chips",2)
      subject.unavailable(1)
      expect(subject.display.class).to eq(String)
    end
  end
      

end
require 'order'

describe Order do
  let(:fake_menu) { double list: { "Salad" => 20, "Curry" => 30 } }
  subject(:order) { Order.new(fake_menu) }

  describe '#items' do
    it "should start as an empty array" do
      expect(subject.items).to eq []
    end
  end

  describe '#total' do
    it "should start as 0" do
      expect(subject.total).to eq 0
    end
  end

  describe '#menu' do
    it "should be an instance of the menu class" do
      expect(subject.menu).to eq fake_menu
    end
  end

  describe '#add' do

    it "should add to the items" do
      allow(subject).to receive(:user_input).and_return(["Salad"])
      subject.add

      expect(subject.items.length).to eq 1
      expect(subject.items[0]).to eq "Salad: 20"
    end

    it "adds the cost to the total" do
      allow(subject).to receive(:user_input).and_return(["Salad"])
      expect(subject).to receive(:user_input)

      subject.add

      expect(subject.total).to eq 20
    end

  end

end

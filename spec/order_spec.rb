require 'order'

describe Order do
  let(:fake_menu) { double list: { "Salad" => 20, "Curry" => 30 } }
  subject(:order) { Order.new(fake_menu) }

  describe '#add' do
    it "should add to the items and add the cost to the total" do
      allow(subject).to receive(:user_input).and_return(["Salad"])
      subject.add
      expect(subject.total).to eq 20
      expect(subject.items.length).to eq 1
      expect(subject.items[0]).to eq "Salad: 20"
    end
  end

end

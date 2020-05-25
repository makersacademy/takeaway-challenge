require 'order'

describe Order do

  it 'creates a new instance of order' do
    expect(subject).to be_instance_of Order
  end

  describe '#add_to_order' do

    it 'records the users order' do
      expect(subject).to respond_to(:add_to_order).with(2).arguments
    end
  end

  describe '#add_to_order' do

    it 'adds the users items to the basket' do
      subject.add_to_order("item", 2)
      expect(subject.basket).to eq({ "item" => 2 })
    end
  end

  describe '#basket_total' do

    it "calculates current order total" do
      subject.add_to_order("Tuna Poke Bowl", 2)
      expect(subject.basket_total).to eq 16
    end
  end

  describe '#order_summary' do

    it "prints summary for each item" do
      subject.add_to_order("Tuna Poke Bowl", 2)
      expect { subject.order_summary }.to output("Tuna Poke Bowl x 2: £16\n").to_stdout
    end
  end
end

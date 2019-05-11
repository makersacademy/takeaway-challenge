require 'take_away'

describe TakeAway do
  context '#read_menu' do

    it 'exists' do
      expect(subject).to respond_to(:read_menu)
    end

    it 'returns an array' do
      expect(subject.read_menu).to be_instance_of(Array)
    end
  end

  context '#order' do
    it 'selects dish' do
      allow(subject).to receive(:menu).and_return([{:index=>1, :item=>"Miso Soup", :amount=>"2.00"}])
      dish = 1
      expect(subject.order(dish)).to eq("You have added Miso Soup to your basket.")
    end
  end
end

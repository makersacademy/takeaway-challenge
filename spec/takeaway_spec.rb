require 'takeaway'
require 'webmock/rspec'

describe Takeaway do
  let(:item) {double(:item)}
  let(:dish) {{"Hamburger" => 5}}

  before do
    stub_request(:post, "https://api.twilio.com/2010-04-01/Accounts/AC033ff5fd1ab50ecf84e702ae695c4053/Messages.json").
     with(:body => {"Body"=>"This can contain anything.", "From"=>"+441256830268", "To"=>"+447515356421"},).
     to_return(:body => "")
  end

  describe '#items' do
    it 'contains items initially' do
      expect(subject.dishes).not_to be_empty
    end
  end

  describe '#menu' do
    it {is_expected.to respond_to(:menu)}
  end

  describe '#add' do
    it 'adds an item to the order' do
      subject.add("Hamburger")
      expect(subject.total_order).to include(dish)
    end

    it 'can add multiple items' do
      expected_hash = [{"Hamburger"=>5}, {"Hamburger"=>5}, {"Hamburger"=>5}]
      expect(subject.add("Hamburger", 3)).to eq(expected_hash)
    end
  end

  describe '#view_dishes' do
    it 'should list all available items and prices' do
      expect(subject.view_dishes).to eq subject.dishes
    end
  end

  describe '#total_order_cost' do
    it 'returns the total cost of the order' do
      cost = dish["Hamburger"] * 3
      subject.add("Hamburger", 3)
      expect(subject.total_order_cost).to eq(cost)
    end
  end

  describe '#place_order' do
    it 'checks whether expected total is equal to actual total' do
      subject.add("Hamburger", 3)
      expect{subject.place_order(3)}.to raise_error "Order total is £15. You expected £3."
    end

    context 'send SMS' do
      it 'sends an SMS if order is successful' do
        subject.add("Hamburger", 3)
        one_hour_ahead = DateTime.now + (1/24.0)
        expect(subject).to receive(:send_sms).with("Thank you! Your order costs £15 and will be delivered before #{one_hour_ahead.strftime "%H:%M"}")
        subject.place_order(15)
      end
    end
  end

end

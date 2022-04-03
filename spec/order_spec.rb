require_relative '../lib/order'

describe Order do
  let (:order) { Order.new }

  context 'when creating a current order' do

    it 'an empty array is created' do
      expect(order.current_order).to be_empty
    end
  end

  context 'when adding to the current order' do

    before do
      @fake_dish = double('fake dish', name: 'pasta', price: 10)
      order.add_to_order(@fake_dish)
    end

    it 'the dish is added to the array' do
      expect(order.current_order).to_not be_empty
    end

    it 'the list of dishes added can be viewed' do
      expect do
        order.view_order_summary
      end.to output(a_string_including("pasta, £10")).to_stdout
    end

    it 'the list of dishes added can be calculated' do
      @another_fake_dish = double('another fake dish', name: 'pizza', price: 10)
      order.add_to_order(@another_fake_dish)
      expect do
        order.view_order_summary
      end.to output(a_string_including("Your total: £20")).to_stdout
    end
  end

  context 'when completing the order' do

    it "raises an error when the order is empty" do
      expect { subject.confirm_purchase }.to raise_error "You have not added any dishes"
    end

    it 'confirms purchase & time of delivery' do
      @fake_dish = double('fake dish', name: 'pasta', price: 10)
      order.add_to_order(@fake_dish)
      time = (Time.now + 3600).strftime("%H:%M")
      expect do
        order.confirm_purchase
      end.to output(a_string_including("Thank you! Your order was placed and will be delivered before #{time}!")).to_stdout
    end
  end
end

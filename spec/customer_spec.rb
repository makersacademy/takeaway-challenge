require 'customer'

describe Customer do
  let(:subject) {described_class.new("Pedro", "+4477777777")}
  let(:restaurant) {double :restaurant}
  let(:orderClass) {double (:orderClass), :new => order}
  let(:order) {double :order}

  describe '#request_menu' do
    it 'asks the restaurant to display its menu' do
      subject.select_restaurant restaurant
      expect(restaurant).to receive( :display_menu )
      subject.request_menu
    end
  end

  describe '#create_order' do
    it 'creates an order object' do
      subject.create_order(orderClass)
      expect(subject.order).to eq order
    end
  end

  describe '#update_order' do
    it 'tells the order object to call its add method' do
      subject.select_restaurant restaurant
      subject.create_order orderClass
      allow(subject.order).to receive(:add)
      expect(subject.order).to receive( :add ).with(restaurant, :pizza, 2)
      subject.update_order :pizza, 2
    end
  end

  describe '#display_order' do
    it 'sends a display_order message to the order object' do
      subject.select_restaurant restaurant
      subject.create_order orderClass
      expect(order).to receive(:display_order).with(restaurant)
      subject.display_order
    end
  end

  describe '#submit_order' do
    it 'asks the restaurant to send the customer a confirmation text' do
      subject.select_restaurant restaurant
      allow(restaurant).to receive( :send_text )
      subject.submit_order
    end
  end

end

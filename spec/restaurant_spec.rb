require 'restaurant' 

RSpec.describe Restaurant do
  
  describe '#show_menu' do
    it 'shows the menu of the restaurant' do
      expect(subject.show_menu).to eq(create_example_menu)
    end
  end

  describe '#create_order' do
    it 'creates a new Order-Object and returns it' do
      expect(subject.create_order).to be_a(Order)
    end
  end

  describe '#add_dish_to_order' do
    it 'adds dishes to an order' do
      subject.create_order()
      subject.add_dish_to_order('Chips')
      subject.add_dish_to_order('Chips')
      subject.add_dish_to_order('I am not in the the menu')
      subject.add_dish_to_order('Beer')
      expect(subject.show_order).to eq(create_example_order)
    end
    it 'send a note if no order created yet' do
      expect(subject.add_dish_to_order('Chips')).to eq('No order created yet, you cannot add a dish')
    end
  end

  describe '#submit_order' do
    it 'sends a confirmation that the order has been placed' do
      allow(subject).to receive(:send_sms).with(anything) do |arg|
        arg
      end
      subject.create_order()
      subject.add_dish_to_order('Chips')
      subject.add_dish_to_order('Beer')
      t = Time.now
      expect(subject.submit_order).to eq(
        "Order has been submitted and will arrive #{t.hour + 1}:#{t.min}! To be paid: 9.60€")
    end
    it 'closes the order' do
      allow(subject).to receive(:send_sms).with(anything) do |arg|
        arg
      end
      order = double('Order', :finish_order => nil, :calc_sum => 10, :basket => [{ 'Test' => 5 }])
      subject.submit_order(order)
      expect(order).to have_received(:finish_order)
    end
    it 'sends a note if no order has been created yet' do
      expect(subject.submit_order).to eq('No order created yet, cannot submit it')
    end
    it 'sends a note if no order are in the basket yet' do
      subject.create_order
      expect(subject.submit_order).to eq('No dishes in order yet, cannot submit')
    end
  end

  describe '#show_order' do
    it 'returns a message if no order created yet' do
      expect(subject.show_order).to eq('No order created yet, cannot show anything')
    end
  end

end

def create_example_menu
  {
    'Chips' => 6.40,
    'Fish' => 8.0,
    'Beer' => 3.20,
    'Milk' => 1.00
  }
end

def create_example_order
  [
    { 'Chips' => 6.40 },
    { 'Chips' => 6.40 },
    { 'Beer' => 3.20 },
    { 'Sum' => 16 }
  ]
end

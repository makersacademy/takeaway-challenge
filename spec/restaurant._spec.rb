require 'restaurant'
thai_titanic = Restaurant.new
describe Restaurant do
  describe '#new_order' do
    it 'creates a new order' do
      expect(thai_titanic.new_order).to be_an(Order)
    end
  end

  describe '#finalise_order' do
    it 'sends a text when passed true' do
      # allow(thai_titanic).to receive(:finalise_order).with(5.99)
      # # allow(order).to receive(:verify).with(5.99).and_return true
      # # allow(order).to receive(:check_total).and_return true
      # expect(thai_titanic.finalise_order(5.99)).to receive(:send_text)
      # thai_titanic.finalise_order(5.99)
      order_double = double :order
      order_class_double = double :order_class, new: order_double
      friday_order = thai_titanic.new_order(order_class_double)
      allow(order_double).to receive(:verify) { 4.99 }
      # expect(order_double).to receive(verify(4.99))
      thai_titanic.finalise_order(4.99)
    end
  end

  describe "#send text" do
    time = (Time.now+(60*60)).strftime("%H:%M")
    it 'sends a text back to the user' do
      expect { thai_titanic.send_text } .to output("Thank you! Your order was placed and will be delivered before #{time}.\n").to_stdout
    end
  end
    
end


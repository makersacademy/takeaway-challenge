require 'restaurant'
thai_tanic = Restaurant.new
describe Restaurant do
  describe '#new_order' do
    it 'creates a new order' do
      text_double = double :text
      text_class_double = double :text_class, new: text_double
      allow(thai_tanic)
      expect(thai_tanic.new_order).to be_an(Order)
    end
  end

  describe '#finalise_order' do
    it 'sends a text when passed true' do
      order_double = double :order
      order_class_double = double :order_class, new: order_double
      friday_order = thai_tanic.new_order(order_class_double)
      text_double = double :text
      text_class_double = double :text_class, new: text_double
      allow(order_double).to receive(:verify) { 4.99 }
      allow(text_double).to receive(:send)
      thai_tanic.finalise_order(4.99)
    end
  end

  # describe "#send text" do
  #   time = (Time.now+(60*60)).strftime("%H:%M")
  #   it 'sends a text back to the user' do
  #     expect { thai_titanic.send_text } .to output("Thank you! Your order was placed and will be delivered before #{time}.\n").to_stdout
  #   end
  # end
    
end


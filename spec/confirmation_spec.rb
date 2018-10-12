require 'confirmation'

describe Confirmation do

  describe '#confirmation_text' do
    it 'sends a text to the user to confirm their order' do
      # order_form = OrderForm.new
      # order_form.add_to_order("muffin")
      # order_form.add_to_order("cookie")
      # invoice = Invoice.new(order_form.order)
      expect(subject.confirmation_text).to eq "Thank you! Your order was placed and will be delivered before 18:52"
    end
  end

end

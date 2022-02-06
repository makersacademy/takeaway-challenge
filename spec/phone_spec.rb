require 'phone'
require 'takeaway'

describe Phone do
  describe '#receive' do
    it 'should receive a text message' do
      text_double = double :text, text: "Thank you! Your order was placed and will be delivered before 18:00"
      phone = Phone.new(text_double)
      expect(phone.receive).to eq text_double.text
    end 
  end 
end

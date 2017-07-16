require 'takeaway'
require 'twilio-ruby'

describe Takeaway do
  let(:takeaway) {described_class.new}
  # let(:menu) {double :menu}
  let(:my_order) {{"Dal Tadka" =>1,"Rice" =>1,"Naan" =>1}}
  let(:total) {9.50}

    context 'customer can see the menu' do
      it 'allows customers to see the menu' do
        expect(takeaway.menu).to be_a Hash
      end
    end

    context 'customer can place order and confirm price' do

      it 'can confirm the total price of orders' do
        takeaway.place_order(my_order,total)
        expect(takeaway.price).to eq (total)
      end

      it 'raises error if total does not match that' do
        takeaway.place_order(my_order,total)
        takeaway.price
        expect{takeaway.confirm_order}.to raise_error 'Sorry total does not match'
      end

        context 'send sms on complete order' do
          before do
            allow(takeaway).to receive(:send_text)
          end
          it 'sends text message' do
            expect(takeaway).to receive(:send_text).with("Thank you! Your order was placed and will be delivered before 00:00")
            takeaway.complete_order
        end
      end  

    end
end

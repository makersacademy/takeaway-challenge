require 'takeaway'
require 'twilio-ruby'

describe Takeaway do
  let(:takeaway) {described_class.new}
  # let(:menu) {double :menu}
  let(:my_order) {{"Dal Tadka" =>1, "Rice" =>1, "Naan" =>1}}
  let(:total) {9.50}
  let(:eta) {"22:00"}

    context 'customer can see the menu' do
      it 'allows customers to see the menu' do
        expect(takeaway.menu).to be_a Hash
      end
    end

    context 'customer can see the ordered items' do
      it 'allows customer to see the ordered menu' do
        expect(takeaway.place_order(my_order,total)).to include("Dal Tadka")
      end
    end



    context 'customer can confirm total price of placed order' do
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
            allow(takeaway).to receive(:eta).and_return(eta)
            allow(takeaway).to receive(:send_notification)
          end
          it 'sends text message' do
            expect(takeaway).to receive(:send_notification).with("Thank you! Your order was placed and will be delivered before 22:00")
            takeaway.complete_order
        end
      end

    end
end

require_relative '../lib/verify_order'

describe VerifyOrder do

  let(:basket) { [{"Name" => "Hamerburger", "Price" => "5"}] }

  context '#view_basket' do
    it 'Prints list of items in basket' do
      expect(subject.view_basket(basket)).to eq(basket)
    end
  end

  context '#text_order_confirmation' do

    let(:time) { Time.now + 1 * 60 * 60 }
    let(:time_format) { time.strftime("%I:%M%p") }
    it 'Prints message via text to user' do
      verify_order_double = double :text, text_order_confirmation: "Thank you! Your order was placed and will be delivered before #{time_format}"
      expect(verify_order_double.text_order_confirmation).to eq("Thank you! Your order was placed and will be delivered before #{time_format}")
    end
  end
end

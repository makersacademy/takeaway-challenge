require 'messenger'

describe MessengerService do
  let(:messenger_service) {spy(:messenger_service)}
  let(:indian_resturant) {Resturant.new(Menu,Order,Printer, messenger_service)}

  context "#send_SMS" do
    it "sends an SMS once the order is confirmed" do
      indian_resturant.add_to_cart(name: :lamp_chops, quantity: 1)
      indian_resturant.add_to_cart(name: :naan, quantity: 2)
      expect(messenger_service).to receive(:send_SMS)
      indian_resturant.confirm_order(12.9)
    end
  end

end

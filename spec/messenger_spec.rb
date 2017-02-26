require 'messenger'

describe MessengerService do
  let(:messenger_service) {spy(:messenger_service)}
  let(:indian_resturant) {Resturant.new(Menu,Order,Printer, messenger_service)}

  context "#send_SMS" do
    before do
      indian_resturant.add_to_cart(name: :lamb_chops, quantity: 1)
      indian_resturant.add_to_cart(name: :naan, quantity: 2)
    end

    it "sends an SMS once the order is confirmed" do
      expect(messenger_service).to receive(:send_SMS).once
      indian_resturant.confirm_order(12.9)
    end

  end

  # context "#initialize" do
  #   let(:client) {double(:client)}
  #
  #   before do
  #     allow(client).to receive(:new){client}
  #     allow(client).to receive_message_chain(:account, :messages,:create)
  #     messenger_service = MessengerService.new(client)
  #   end
  #
  #   it "can change the client being used at initialisation" do
  #     expect(client).to receive_message_chain(:account, :messages, :create)
  #     messenger_service.send_SMS
  #   end
  #
  # end
  ### might have to create a FakeSMS module and give it behavior

end

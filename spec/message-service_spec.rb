require './lib/message-service.rb'

require 'time'

describe MessageService do
  subject(:message_service) { described_class.new }
  let(:takeawayapp) { double 'takeawayapp', menu_selection: [['Margarita', 1, 10], ['Pepperoni', 2, 24], ['Vegetarian', 3, 33]], total: 67 }

  describe "#message_manager" do

    it "creates & sends the message to customer" do
      expect(message_service).to receive(:send_message)
      message_service.message_manager(takeawayapp.menu_selection, takeawayapp.total)
    end
  end
end

require "ordering_interface.rb"
require "time"

describe OrderingInterface do
  let(:confirmation_message) {
    "Thank you! Your order was placed and will be delivered before #{Time.now.strftime('%H:%M')}."
  }
  let(:fake_sms_util) { double :SmsConfirmationClient }
  let(:fake_sms_client) { double :@sms_client }
  let(:interface) {
    described_class.new(sms_util: fake_sms_util)
  }

  before do
    allow(fake_sms_client)
      .to receive(:send_sms)
      .with(confirmation_message)
      .and_return(confirmation_message)

    allow(fake_sms_util)
      .to receive(:new)
      .with(
        account_sid: "1234",
        auth_token: "1234",
        sender_num: "1234",
        recipient_num: "1234"
      )
      .and_return(fake_sms_client)
  end

  context "without sms api" do
    it "#order - regular case without api" do
      expect(
        interface.order(
          {
            gelatinous_grime_goulash: 2,
            reeking_rat_ravioli: 1,
            slug_slime_secretion_soup: 2,
            total: 5
          }
        )
      ).to eq confirmation_message
    end

    it "#order - no total given" do
      expect {
        interface.order(
          {
            gelatinous_grime_goulash: 2,
            reeking_rat_ravioli: 1,
            slug_slime_secretion_soup: 2
          }
        )
      }.to raise_error "No total given!"
    end

    it "#order - total doesn't match" do
      expect {
        interface.order(
          {
            gelatinous_grime_goulash: 2,
            total: 3
          }
        )
      }.to raise_error "Total doesn't match!"
    end

    it "#order - unknown dish" do
      expect {
        interface.order(
          {
            gelatinous_grime_goulash: 2,
            spaghetti_bolognese: 1,
            total: 3
          }
        )
      }.to raise_error "Unknown dish!"
    end

    it "#menu - show menu with prices" do
      expected_output = ""
      described_class::HORRID_DISHES.each { |dish, price|
        expected_output += "#{dish}: £#{price}\n"
      }
      expect { interface.menu }
        .to output(expected_output)
        .to_stdout
    end
  end

  context "with sms api" do

    it "#customer_login - requires api details" do
      expect(
        interface.customer_login(
          account_sid: "1234",
          auth_token: "1234",
          sender_num: "1234",
          recipient_num: "1234"
        )
      ).to be true
    end

    it "#order - should send SMS with confirmation message" do
      interface.customer_login(
        account_sid: "1234",
        auth_token: "1234",
        sender_num: "1234",
        recipient_num: "1234"
      )
      expect(
        interface.order(
          {
            gelatinous_grime_goulash: 2,
            reeking_rat_ravioli: 1,
            slug_slime_secretion_soup: 2,
            total: 5
          }
        )
      ).to eq confirmation_message
    end
  end
end

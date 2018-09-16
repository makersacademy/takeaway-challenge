require 'sms_receiver'

RSpec.describe SMSReceiver do
  let(:mock_restaurant) { double :mock_restaurant, menu: mock_menu, on_the_menu?: true }
  let(:mock_menu) { double :mock_menu, display_menu: ["Spaghetti: 2", "Meatballs: 3"],
                    search_menu: { price: 5 }
  }
  let(:mock_time) { double :mock_time, now: Time.at(0) }
  parsed_order = [{ dish: "Spaghetti and Meatballs", quantity: 1 }]

  subject { described_class.new(restaurant: mock_restaurant, time_client: mock_time) }

  it "can parse orders given to it by text" do
    expect(subject.parse_order("Spaghetti and Meatballs: 1")).to eq(parsed_order)
  end

  context "when asked to respond to a non-order message" do
    it "displays the menu when asked to" do
      menu_request = subject.parse_order("menu")
      expect(subject.respond(menu_request)).to eq "Spaghetti: 2\nMeatballs: 3"
    end

    it "displays the instructions when asked to" do
      instruction_request = subject.parse_order("instructions")
      instruction_response = subject.help + "\nText 'menu' to see the menu."
      expect(subject.respond(instruction_request)).to eq instruction_response
    end

    it "tells the user when they try to order something not on the menu" do
      allow(mock_restaurant).to receive(:on_the_menu?).and_return(false)
      error_response = "You have selected a dish which is not on the menu.\n"
      expect(subject.respond([{ dish: "Bolognese", quantity: 1 }])).to eq error_response + subject.help
    end
  end

  context "when given a correct order to respond to" do
    it "confirms total bill and time of arrival" do
      order_confirmation = ["Thank you for your order.",
                            "Your total bill is £5.00.",
                            "Your food will arrive by 02:00"
]
      expect(subject.respond(parsed_order)).to eq order_confirmation.join("\n")
    end
  end
end

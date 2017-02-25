require 'orderconsole'

describe OrderConsole, :o do
  let(:chinese) { double }
  subject(:orderconsole) { described_class.new(chinese) }

  it "returns the menu dish" do
    menu = {"Charsui pork" => 5, "Choisum" => 3, "Drink" => 1}
    allow(chinese).to receive_messages(restaurant_menu: menu)
    expect(orderconsole.show_menu).to eq(menu)
  end

  # it "records the user's choices" do
  #   expect(orderconsole.order).to
  # end
end

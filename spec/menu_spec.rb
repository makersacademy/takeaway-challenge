require "menu"

describe Menu do
  let(:sms) { double :sms, confirm_order }
  subject(:menu) { described_class.new }

  before do
    expect(menu.place_order).to receive(:sms.confirm_order)
  end

  it "displays the list of items and prices" do
    expect(menu).to respond_to(:view)
  end

  it "returns items and prices" do
    expect{ menu.view }.to output("Burger = £3\nHotdog = £2\n").to_stdout
  end

  # describe '#place_order' do
  #   it "sends an sms" do
  #     expect{ menu.place_order }.to
  #   end
  # end
end

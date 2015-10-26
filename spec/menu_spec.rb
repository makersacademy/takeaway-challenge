require 'menu'

describe Menu do

  let(:dish)  { {"Chips" => 0.89} }
  let(:subject) {described_class.new(dish)}
  let(:dish1) {["Chips - £0.89"]}

  it "shows list of dishes and prices" do
    expect(subject.show_menu).to eq(dish1)
  end

  it "tells if a dish is available for order" do
    expect(subject.can_order?("Steak")).to eq(false)
  end

end

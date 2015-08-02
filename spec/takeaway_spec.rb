require "takeaway"
describe Takeaway do
  it { is_expected.to respond_to(:menu)}
  it "displays menu items and prices" do
    our_menu = { "pizza" => 5.95, "pasta" => 6.45, "curry" => 6.95, "toast" => 0.1, "fajitas" => 6.45, "bacon sandwich" => 3.50, "steak and chips" => 10.95 }
    expect(subject.menu).to eq our_menu 
  end
  it { is_expected.to respond_to(:place_order).with(1).argument}
  it { is_expected.to respond_to(:place_order).with(3).argument}
  it "places order of dishes" do
    subject.place_order("pizza", "pasta")
    expect(subject.order).to eq ["pizza", "pasta"]
  end
  it "doesn't accept orders of items not on the menu" do 
    expect { subject.place_order("grilled baby", "toast", "steak and chips") }.to raise_error "Apologies, we do not have grilled baby on the menu."
  end
end
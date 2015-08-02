require "takeaway"
describe Takeaway do
  it { is_expected.to respond_to(:menu)}
  it "displays menu items and prices" do
    our_menu = {"pizza" => 5.95, "pasta" => 6.45, "curry" => 6.95, "toast" => 0.1, "fajitas" => 6.45}
    expect(subject.menu).to eq our_menu 
  end
end
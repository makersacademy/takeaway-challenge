require 'menu'

describe Menu do
  subject { Menu.new(dishes) }
  let(:dishes) { {"Pad Krapow": 7, "Pad See Ew" => 7, "Pad Thai" => 6, "Spring Rolls" => 4, "Thai Green Curry" => 9, "Rice" => 3,"Pad Krapow" => 7} }
  let(:printed_menu) { ["Dish: Pad Krapow - £7", "Dish: Pad See Ew - £7", "Dish: Pad Thai - £6", "Dish: Spring Rolls - £4", "Dish: Thai Green Curry - £9", "Dish: Rice - £3", "Dish: Pad Krapow - £7"] }

  it "should initialize a menu with a list of dishes" do
    expect(subject.dishes).to eq dishes
  end

  it "should print menu" do
    expect(subject.print).to eq printed_menu
  end
end

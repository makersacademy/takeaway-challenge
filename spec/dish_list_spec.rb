require "dish_list"

describe Restaurant do
  it "has a list of dishes with prices" do
    expect(subject.show_menu).to eq dish1: 10, dish2: 14, dish3: 9
  end
end

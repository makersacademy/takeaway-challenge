require "takeaway"

describe Takeaway do

  let(:dishes){ {'hamburger' => 2} }
  let(:dish){'hamburger'}


  it "expect takeaway to print the menu" do
    expect(subject.menu_restaurant).to eq(dishes)
  end

  it "expect to select the dishes from the menu" do
    subject.select_dishes(dish)
    expect(subject.selected_dishes).to eq([dishes])
  end

end

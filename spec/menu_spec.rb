require "menu"

describe Menu do
  it "contains empty array when initiated" do
    expect(subject).to have_attributes(:menu => {})
  end

  it "adds food to the menu" do
    subject.add("Breakfast, 2")
    expect(subject).to have_attributes(:menu => { "Breakfast" => "2" })
  end

  it "lists menu" do
    sample = "Beef Burger, 5, Chicken Burger, 4, Slice of Pizza, 4"
    subject.add(sample)
    expect { subject.list }.to output(
      "Beef Burger £5\nChicken Burger £4\nSlice of Pizza £4\n"
    ).to_stdout
  end
end

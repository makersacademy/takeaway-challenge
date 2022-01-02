require "menu"

describe Menu do
  it "contains empty array when initiated" do
    expect(subject).to have_attributes(:dishes => {})
  end

  it "adds food to the menu" do
    subject.add("Breakfast, 2")
    expect(subject).to have_attributes(:dishes => { "Breakfast" => "2" })
  end

  it "lists menu" do
    sample = "Beef Burger, 5, Chicken Burger, 4, Slice of Pizza, 4"
    subject.add(sample)
    expect { subject.list }.to output(
      "1- Beef Burger £5\n2- Chicken Burger £4\n3- Slice of Pizza £4\n"
    ).to_stdout
  end
end

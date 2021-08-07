require 'takeaway'
describe Takeaway do
  
  it "has items in the menu" do
    expect(subject.menu).not_to be_empty
  end

  it "displays the menu" do
    expect(subject.show_menu).to eq subject.menu
  end

  it "allows items to be ordered" do
    subject.add_item("Samosa")
    expect(subject.basket).to eq({ "Samosa" => 1 })
  end

  it "shows the total" do
    subject.add_item("Samosa")
    expect { subject.total }.to output("1.70").to_stdout
  end

  it "displays a summary of the current order" do
    subject.add_item("Samosa", 2)
    expect { subject.summary }.to output("2x Samosa £3.40 ").to_stdout
  end

end

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
    expect(subject.total).to eq(1.70)
  end

  it "displays a summary of the current order" do
    
  end

end

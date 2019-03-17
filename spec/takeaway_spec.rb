require 'takeaway'

describe Takeaway do
  it "#should have a print method to print the menu" do
    expect(subject.print_menu).to eq(@menu)
  end

  
end

    # it "prints a copy of the takeaway menu" do
    # expect(menu).to receive(:print)
    # subject.print_menu
    # end

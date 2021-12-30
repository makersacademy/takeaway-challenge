require "takeaway"

describe Takeaway do

  let(:menu) { double(:menu) }
  subject { Takeaway.new(menu) }

  it "has a menu" do
    expect(subject).to have_attributes(:menu => menu)
  end

  it "shows the menu" do
    allow(menu).to receive(:list).and_return("Breakfast, £2")
    expect { subject.show_menu }.to output("Breakfast, £2").to_stdout 
  end
end 

require "interface"

describe Interface do

  subject(:interface) {described_class.new}

  # As a customer
  # So that I can order the meal I want
  # I would like to be able to select some number of several available dishes

  it "can select some number of a selected dishes" do
    interface.choice(1)
    interface.choice(2)
    expect(interface.selection.count).to eq 2
  end

end

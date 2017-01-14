require './lib/menuhash'

describe Menuhash do

  #double allow to receive return from hash

  it "holds a hash of dishes" do
    expect(subject.menu_list).to respond_to
  end

  it "stores dishes with their prices" do
    expect(subject.list["Greek-style roast fish"]).to eq(4.50)
  end

  it "iterates out rows to the menu" do

  end


end

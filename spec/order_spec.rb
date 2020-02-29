require 'order'

describe Order do

  it "has attribute current_order which is empty by default" do
    expect(subject).to have_attributes(current_order: [])
  end


end

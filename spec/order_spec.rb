require 'order'

describe Order do

  it "has attribute current_order which is empty by default" do
    expect(subject).to have_attributes(current_order: [])
  end

  context '#select_dish' do

    it "responds to a method select_dish" do
      expect(subject).to respond_to(:select_dish)
    end

  end


end

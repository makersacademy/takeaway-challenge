require 'takeaway'

describe Takeaway do

subject(:takeaway) {described_class.new}

  it 'has a menu on inititialisation' do
  expect(takeaway.menu).to be_instance_of(Hash)
  end

    describe '#view_menu'do
    it "has a method which prints the contents of menu" do
    expect(takeaway.view_menu).to include "Spring Rolls"
    end


  end

end

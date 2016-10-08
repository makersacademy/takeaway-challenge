require 'takeaway'

describe Takeaway do

  subject(:takeaway) {described_class.new}
  let(:menu) {Menu.new}

  context 'class of instance' do

    it " creates an instance of the class" do
      expect(takeaway).to be_instance_of(Takeaway)
    end
  end

  describe "#see_menu" do

    it "lists the menu to the user" do
    expect(takeaway.see_menu).to eq(menu.menu_list)
    end
  end

end

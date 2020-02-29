require 'takeaway'

describe Takeaway do
  subject(:takeaway) { described_class.new(menu: menu_dbl) }

  let(:menu_dbl) { double(:menu, print: view_menu_dbl) }
  let(:view_menu_dbl) { "veggie pizza : 5.5" }


  it "shows the menu with dishes and prices" do
    expect(takeaway.view_menu).to eq(view_menu_dbl)
  end

  context '#view_menu' do

    it "has a list of available items called menu" do
      expect(subject).to respond_to(:view_menu)
    end



  end
end

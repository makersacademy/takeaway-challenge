require 'menu'

describe Menu do

  describe "#initialize" do
    it "should return the menu" do 
    expect(subject.menu).to be Menu::MENU
  # subject { Menu.new }  
  #   it { is_expected.not_to be_empty}
  end
end
  

end

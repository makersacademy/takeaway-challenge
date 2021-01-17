require 'menu'

describe Menu do

  describe "#menu" do
    subject { Menu.new.menu }  
    it { is_expected.not_to be_empty}
  end
  

end

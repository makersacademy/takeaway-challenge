require "menu"

describe Menu do
    
  it { is_expected.to be_instance_of Menu }
  
  describe "#see_menu" do
    it { is_expected.to respond_to :see_menu }

    it 'should be able to view available dishes' do
        expect(subject.see_menu).to include "Pizza"
    end
    
    
  end
end
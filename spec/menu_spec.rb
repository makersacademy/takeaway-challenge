require 'menu'

describe Menu do
  context 'list given when menu is created' do
    subject(:menu) { described_class.new(@menu) }
  
    before(:each) do
      @menu = {:pizza => 2, :chips => 4}
    end
  
    it 'should display the  menu' do
      expect(subject.display).to eq @menu
    end  
  
    it 'should know if a dish is on the menu' do
      expect(subject.contains_item?("pizza")).to eq true
    end

    it 'should know if a dish is not on the menu' do
      expect(subject.contains_item?("cake")).to eq false
    end
  end
end

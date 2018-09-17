require 'takeaway'
describe CustOrder do
  
  describe '#menulist functions' do
    it { is_expected.to respond_to(:dishlection) }
    it { is_expected.to respond_to(:show_menu) }
    it 'Should show menu' do
      expect(subject.show_menu).to eq([])
    end
    it 'Should select correct dish' do
      expect(subject.dishlection("Chicken Gyoza 5pcs")).to eq([{ :platter => "Chicken Gyoza 5pcs", :price => 4.5, :quantity => 0 }])
    end
  end
end

require 'takeaway'
describe CustOrder do
  
  describe '#menulist functions' do

    it 'Should puts menu' do
      expect(subject.show_menu).to eq(puts subject.j_menu)
    end
  end
end

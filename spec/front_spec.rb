require_relative '../lib/front.rb'

describe Front do

  let(:menu) {double(:menu)}
  let(:order) {double(:order)}
  let(:front) {Front.new(menu, order)}

  describe '#main_choice' do
    it "should give the user choice of;
    show memu, add to order, check order, comfirm order" do
      text ="type: 'menu' for the menu, 'add' to add to the order,
'show order' to show the order or 'confirm order' to confirm the order\n"
      expect{ subject.main_choice }. to output(text).to_stdout
    end
  end
end

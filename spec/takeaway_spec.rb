require 'takeaway'

describe Takeaway do

  describe 'menu' do

    let(:menu_1) { double :menu_1 }
    subject(:takeaway) { described_class.new(menu_1) }
    
    it 'initializes with a menu' do
      expect(subject.menu).to eq(menu_1)
    end

    it 'shows menu' do
      allow(menu_1).to receive(:show_menu).and_return 'menu'
      expect(subject.read_menu).to eq('menu')
    end
  end

  describe 'ordering process' do
    
    it 'prints total when completed' do
      subject.add_to_order('vegan fishcake', 2)
      subject.add_to_order('sole', 3)
      expect { subject.complete_order }.to output.to_stdout
    end
  end
end 

require 'takeaway'

describe Takeaway do
    let(:menu) { double :menu }
    let (:takeaway) { described_class.new(menu) }

    describe '#view_menu' do

        it { is_expected.to respond_to(:view_menu) }

        it 'prints the menu' do
            expect(menu).to receive(:print_menu)
            takeaway.view_menu
        end
        
    end
end
require 'takeaway.rb'
require 'menu.rb'

describe Takeaway do
    let(:takeaway) { Takeaway.new }
    let(:menu) { Menu.new }

    it { is_expected.to respond_to :menu }

    describe '#read_menu' do
        it { is_expected.to respond_to :read_menu }

        it 'reads the menu' do
            takeaway.read_menu
            expect(takeaway.read_menu).to eq menu.printed_menu
        end
    end
    
end
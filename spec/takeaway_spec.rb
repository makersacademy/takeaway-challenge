require 'takeaway'

describe Takeaway do
let(:menu) { double :menu }

subject {described_class.new(menu)}
  
  describe '#initialize' do
    it 'creates a menu' do
    expect(subject.menu).to eq menu
    end
  end
end
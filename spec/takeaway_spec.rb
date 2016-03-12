require 'takeaway'

describe TakeAway do
  subject(:takeaway) { described_class.new }
  let(:menu) {double :menu}

  it 'should respond to list_menu method' do
    expect(takeaway).to respond_to :list_menu
  end

  describe '#initialize' do
    it 'should initialize with a menu hash' do
      expect(takeaway.menu).to be_a Hash
    end

    it 'should initialize with selection hash' do
      expect(takeaway.selection).to be_a Hash
    end

    it 'should initializa the selection hash as empty' do
      expect(takeaway.selection).to be_empty
    end
  end

  describe '#list_menu' do
    # NOT SURE ABOUT THIS TEST *****************
    it 'should list the food items and prices' do
      allow(takeaway).to receive(:list_menu).and_return menu
      expect(takeaway.list_menu).to eq menu
    end
  end
end

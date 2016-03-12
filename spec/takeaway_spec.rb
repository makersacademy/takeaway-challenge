require 'takeaway'

describe TakeAway do
  subject(:takeaway) { described_class.new }
  let(:menu) {double :menu }

  it 'should respond to list_menu method' do
    expect(takeaway).to respond_to :list_menu
  end

  # CHANGE TO 2 ARGUMENTS WHEN ADDING IN QUANTITY *********
  it 'should respond to order method' do
    expect(takeaway).to respond_to(:order).with(1).argument
  end

  describe '#initialize' do
    it 'should initialize with a menu hash' do
      expect(takeaway.menu).to be_a Hash
    end

    # it 'should initialize with selection hash' do
    #   expect(takeaway.selection).to be_a Hash
    # end
    #
    # it 'should initializa the selection hash as empty' do
    #   expect(takeaway.selection).to be_empty
    # end
  end

  describe '#list_menu' do
    # NOT SURE ABOUT THIS TEST *****************
    it 'should list the food items and prices' do
      allow(takeaway).to receive(:list_menu).and_return menu
      expect(takeaway.list_menu).to eq menu
    end
  end

  describe '#order' do
    it 'should raise error message if item inputted is not in menu' do
      message = 'Item not in menu'
      expect{takeaway.order(menu)}.to raise_error message
    end

    it 'should select the item inputted and add to selection hash' do
      
    end
  end
end

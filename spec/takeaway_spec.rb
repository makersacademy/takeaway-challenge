require 'takeaway'

describe Takeaway do

  it { is_expected.to respond_to(:confirm_order) }

  it 'displays a menu' do
    expect(subject.list_menu).to be_a(Hash)
  end

  it 'returns an error if the order selection is empty' do
    message = "You have not selected any items"
    allow(subject).to receive(:list_menu).and_return 'burger'=>2
    expect{subject.confirm_order(8)}.to raise_error message
  end

  it 'returns an error if the selected item is not on the menu' do
    message = "Item not on menu"
    allow(subject).to receive(:list_menu).and_return 'burger'=>2
    expect{subject.select_item('asdf')}.to raise_error message
  end

  context 'the user can' do

    before  do
      @quantity = 4
      @item = 'burger'
      allow(subject).to receive(:list_menu).and_return 'burger'=>2
      subject.select_item(@item, @quantity)
    end

    it 'select items with a quantity' do
      expect(subject.selection).to include(@item => @quantity)
    end

    it 'see the total price for the order' do
      expect(subject.calculate_total).to eq 8
    end

    it 'confirm the order' do
      allow(subject).to receive(:send_text)
      expect(subject.confirm_order(8)).to eq 'Order confirmed'
    end

    it 'returns an error when the user confirmes the incorrect total' do
      message = "Order not confirmed, please check your total and try again."
      expect{subject.confirm_order(1)}.to raise_error message
    end

  end

end

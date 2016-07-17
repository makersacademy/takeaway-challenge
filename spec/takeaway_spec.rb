require 'takeaway'

describe Takeaway do
  # let(:subject) {described_class.new}
  it { is_expected.to respond_to(:confirm_order) }

  it 'displays a menu' do
    expect(subject.list_menu).to be_a(Hash)
  end
  #
  context 'the user can' do

    before  do
      @quantity, @item = 4, 'burger'
      subject.select_item(@item, @quantity)
    end

    it 'select items with a quantity' do
      expect(subject.selection).to include(@item => @quantity)
    end

    it 'see the total price for the order' do
      allow(subject).to receive(:list_menu).and_return({'burger'=>2})
      expect(subject.calculate_total).to eq 8
    end

    it 'confirm the order' do
      allow(subject).to receive(:list_menu).and_return({'burger'=>2})
      expect(subject.confirm_order(8)).to eq 'confirmed'
    end

    it 'returns an error when the user confirmes the incorrect total' do
      message = "Order not confirmed, please check your total and try again."
      allow(subject).to receive(:list_menu).and_return({'burger'=>2})
      expect{subject.confirm_order(1)}.to raise_error message
    end

  end

end

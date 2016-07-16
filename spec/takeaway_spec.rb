require 'takeaway'

describe Takeaway do

  let(:menu) {doube(:menu, "burger" => 200)}

  # let(:subject) {described_class.new(menu)}

  it { is_expected.to respond_to(:select_item) }
  it { is_expected.to respond_to(:calculate_total) }
  # it { is_expected.to respond_to(:confirm_order) }

  it 'displays a menu' do
    expect(subject.list_menu).to be_a(Hash)
  end

  context '#select_item' do

    it 'saves the selection' do
      item, quantity = 'quarter pounder', 4
      expect(subject.select_item(item, quantity)).to eq [item => quantity]
    end
  end

  context '#calculate_total' do

    # it 'shows the total price for the order' do
    #   expect(subject.calculate_total).to eq 5
    # end

  end

end

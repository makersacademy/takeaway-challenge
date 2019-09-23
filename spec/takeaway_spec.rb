require 'takeaway'

describe Takeaway do

  it 'exists!' do
    expect(subject.class).to eq Takeaway
  end

  it { is_expected.to respond_to(:list_dishes) }

  describe '#list_dishes' do
    it 'lists menu items' do
      expect(subject.list_dishes).to eq MENU_ITEMS
    end
  end
end

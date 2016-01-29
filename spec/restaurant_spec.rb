require 'restaurant'

describe Restaurant do

  before do
    allow(menu_klass).to receive(:new) {menu}
    allow(menu2).to receive(:list_items) {items2}
    allow(menu).to receive(:list_items) {items}
  end
  
  let(:menu_klass) {double :menu_klass}
  let(:menu) {double :menu}
  let(:menu2) {double :menu}
  let(:items) {double :items}
  let(:items2) {double :items}
  subject(:restaurant) {described_class.new menu_klass}

  it{is_expected.to respond_to(:menu)}
  it{is_expected.to respond_to(:new_order)}
  it{is_expected.to respond_to(:change_menu)}

  context 'menu management' do

    it 'returns "empty message" when no menu setup' do
      expect(subject.menu).to be items
    end

    it 'allows menu change' do
      subject.change_menu menu2
      expect(subject.menu).to be items
    end

  end

end

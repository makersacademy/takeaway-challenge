require 'restaurant'

describe Restaurant do
  subject = Restaurant.new
  it { is_expected.to respond_to :view_menu}
  it { is_expected.to respond_to :menu}
  it { is_expected.to respond_to :place_order}

describe '#view_menu' do
  context 'when customer asks for a menu' do
    it 'creates a menu for the customer to view' do
      subject.view_menu
      expect(subject.menu).to be_instance_of(Menu)
    end
  end
end

end

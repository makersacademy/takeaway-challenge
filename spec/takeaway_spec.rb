require './docs/takeaway'

describe Takeaway do
  it 'responds to Takeaway class' do
    expect(subject).to be_an_instance_of Takeaway
  end

  describe '#see menu' do
    it 'shows the menu' do
      expect(subject.see_menu).to eq ["Guinness £6.0", "Espresso Martini £12.5", "Ruddles £1.99", "Huel £3.0"]
    end
  end
end

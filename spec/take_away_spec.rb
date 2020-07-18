require 'take_away'
describe TakeAway do
  describe '#view_menu' do
    it 'views menu array' do
      expect(subject.view_menu).to eq subject.menu
    end
  end

  describe '#order' do
    it 'adds an order to my_order variable' do
      expect { subject.order(1) }.to change { subject.my_order }
    end
  end
end

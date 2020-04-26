require 'order_manager'

describe OrderManager do

  let(:restaurants) { double() }

  describe '#get_restaurants' do
    it 'loads restaurants on a restaurant object' do
      allow(restaurants).to receive(:find_restaurants)
      expect(restaurants).to receive(:load_restaurants)
      subject.get_restaurants(restaurants)
    end

    it 'finds a list of restaurants' do
      allow(restaurants).to receive(:load_restaurants)
      expect(restaurants).to receive(:find_restaurants)
      subject.get_restaurants(restaurants)
    end
  end

  describe '#new_order' do
    it 'finds a matching menu' do
      expect { subject.new_order('Italian','',10) }.to change { subject.menu }.to be_a_kind_of(Menu)
    end
  end
end

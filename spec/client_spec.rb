require 'client.rb'

describe Client do
  subject(:client) { described_class.new(:John, '07958188234') }
  let(:order) { double(:ask_order => [{ :item => 1, :name => :" TOMATO, GARLIC & OREGANO ", :price => 4.95, :quantity => 4 },
    { :item => 2, :name => :" TOMATO, MOZZARELLA, BASIL ", :price => 6.4, :quantity => 2 }], :total => 32.6) 
  }

  describe '#attributes' do
    it { is_expected.to respond_to(:name) }
    it { is_expected.to respond_to(:phone_number) }
  end
  describe '#require_menu' do
    it { is_expected.to respond_to(:require_menu) }
  end

  describe '#check_order' do
    it 'checks the order is correct' do
      expect(client.check_order).to eq true
    end
  end

end

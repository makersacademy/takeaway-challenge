require 'rspec'
require_relative '../lib/menu'

describe Menu do
  describe '#new' do
    let(:menu) { described_class.new }
    it 'should create a new menu object' do
      expect(described_class).to eq(Menu)
    end
  end
  describe 'items' do
    context 'where the menu is empty' do
      let(:menu) { described_class.new }
      it 'should return an empty hash' do
        expect(menu.items.empty?).to eq true
      end
    end
    context 'where the menu is populated' do
      let(:menu) { described_class.new("spring roll" => 0.99,
                                       "char sui bun" => 3.99,
                                       "pork dumpling" => 2.99,
                                       "peking duck" => 7.99,
                                       "fu-king fried rice" => 5.99)
      }
      it 'should return a populated hash' do
        expect(menu.items.empty?).to eq false
      end
      it "should return the first value of the key 'spring roll' " do
        expect(menu.items['spring roll']).to eq(0.99)
      end
    end
  end
end

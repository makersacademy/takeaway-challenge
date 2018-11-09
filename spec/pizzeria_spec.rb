require 'pizzeria'

describe Pizzeria do
  subject(:pizzeria){ described_class.new }
  let(:pizza){ double :pizza }

  it { expect(pizzeria).to respond_to(:menu) }


  describe '#show_menu' do
    it 'allow the customer to look at the menu' do
      expect(pizzeria.show_menu).to eq Pizzeria::MENU
    end
  end

  
end

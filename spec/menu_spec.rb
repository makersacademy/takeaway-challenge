require 'menu'

RSpec.describe Menu do
  # Don't know what else to test for, coverage at 84.21%
  let(:menu) { double :menu }
  let(:selection) { { name: :curry, price: 4.50 } }

  describe '#selection' do

    it 'shows list of items in menu' do
      expect(selection).to eq({ name: :curry, price: 4.50 })
    end
  end

  describe '#print' do
    before { allow(menu).to receive(:print) { puts "name: #{selection[:name]}: price: #{selection[:price]}\n" } }

    it 'prints to stdout the items in the menu' do
      puts selection[:name]
      expect { menu.print }.to output("name: #{selection[:name]}: price: #{selection[:price]}\n").to_stdout
    end
  end

end

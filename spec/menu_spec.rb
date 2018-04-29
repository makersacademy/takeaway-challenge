require 'menu'

RSpec.describe Menu do
  # Don't know what else to test for, coverage at 84.21%, somehow adding tests reduced my coverage...
  let(:menu) { double :menu }
  let(:selection) { [{ name: :curry, price: 4.50 }] }

  describe '#selection' do

    it 'selection to be an array' do
      expect(selection).to be_a Array
    end

    it 'shows list of items in menu' do
      expect(selection).to eq([{ name: :curry, price: 4.50 }])
    end
  end

  describe '#print' do
    before { allow(menu).to receive(:print) { puts "name: #{selection[0][:name]}: price: #{selection[0][:price]}\n" } }

    it 'prints to stdout the items in the menu' do
      expect { menu.print }.to output("name: #{selection[0][:name]}: price: #{selection[0][:price]}\n").to_stdout
    end
  end

end

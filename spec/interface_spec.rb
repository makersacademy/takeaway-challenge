require 'interface'

describe Interface do
  # let(:printer) { double('printer', menu:'Menu', items: 'Items' )}
  let(:interface) { described_class.new('Beef & Beer') }

  it { expect(interface).to respond_to(:printer) }
  it { expect(interface).to respond_to(:restaurant) }
  it { expect(interface).to respond_to(:interactive_menu) }
  it { expect(interface).to respond_to(:process).with(1).argument }

  it 'instantiates a Printer and saves it to @printer variable' do
    expect(interface.printer).to be_an_instance_of Printer
  end

  # describe '#process' do
  #   it 'prints restaurant menu when 1 is selected' do
  #     allow(printer).to receive(:print_menu).and_return("Itemsi")
  #     expect{ interface.process('1') }.to output("1. See Menu\n2. Choose Item\n").to_stdout
  #   end
  #     it 'adds an item to the cart based on selection' do
  #       expect{ interface.process('2')}.to eq
  #     end
  # end
end

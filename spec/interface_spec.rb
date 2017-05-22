require 'interface'

describe Interface do
  # let(:printer) { double('printer', menu:'Menu', items: 'Items' )}
  let(:interface) { described_class.new('Beef & Beer') }
ß
  it { expect(interface).to respond_to(:printer) }
  it { expect(interface).to respond_to(:restaurant) }
  it { expect(interface).to respond_to(:interactive_menu) }
  it { expect(interface).to respond_to(:process).with(1).argument }

  it 'instantiates a Printer and saveßßs it to @printer variable' do
    expect(interface.printer).to be_an_instance_of Printer
  end


end

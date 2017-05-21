require 'interface'

describe Interface do
  let(:interface) {described_class.new}


  it { is_expected.to respond_to(:interactive_menu)}
  it { is_expected.to respond_to(:process).with(1).argument }
  it { is_expected.to respond_to(:print_interactive_menu)}

  it 'instantiates a Printer and saves it to @printer variable' do
    expect(interface.printer).to be_an_instance_of Printer
  end


end

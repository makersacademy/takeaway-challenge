require 'printer'

describe Printer do
  # let(:list) { double(:bolognese) }
  # subject { described_class.new(list)}

  it 'should print a list of dishes' do
    # allow(subject).to receive(:print) { puts list}
    expect { subject.print }.to output(/bolognese/).to_stdout
  end
end
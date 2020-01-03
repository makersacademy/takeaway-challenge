require 'interface'

describe Interface do
  subject { described_class.new(basket: basket) }
  let(:basket) { double(:basket, :empty? => false, basket: [{ salmon: 10 }]) }
  
  before do
    allow(subject).to receive(:loop).and_yield
  end

  it 'should give you some options' do
    allow(subject).to receive(:gets).and_return("6\n")
    expect { subject.start }.to output(/choose/).to_stdout
  end

  it 'should print the menu' do
    allow(subject).to receive(:gets).and_return("1\n")
    expect { subject.start }.to output(/DRINK/).to_stdout
  end

  it 'should say the basket is empty' do
    allow(basket).to receive(:empty?) { true }
    allow(subject).to receive(:gets).and_return("2\n")
    expect { subject.start }.to output(/empty/).to_stdout
  end

  it 'should say the basket has a salmon' do
    allow(subject).to receive(:gets).and_return("2\n")
    expect { subject.start }.to output(/Salmon/).to_stdout
  end

  # it 'should add an item to the basket' do
  #   allow(subject).to receive(:gets).and_return("3\n")
    # subject.start
    # allow(subject).to receive(:gets).and_return("salmon\n")
    # allow(subject).to receive(:gets).and_return("2\n")

  #   expect { subject.start }.to output("something").to_stdout
  # end  
end

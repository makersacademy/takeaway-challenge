require 'interface'

describe Interface do
  subject { described_class.new(basket: basket, order: order) }
  let(:basket) { double(:basket, :empty? => false, basket: [{ salmon: 10 }]) }
  let(:order) { double(:order) }
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
    allow(order).to receive(:total)
    allow(subject).to receive(:gets).and_return("2\n")
    expect { subject.start }.to output(/Salmon/).to_stdout
  end

  it 'should clear the basket' do
    allow(subject).to receive(:gets).and_return("4\n")
    allow(basket).to receive(:clear)
    expect { subject.start }.to output(/empty/).to_stdout
  end

  it 'should add a main' do
    allow(basket).to receive(:add)
    allow(subject).to receive(:gets).and_return("3\n", "salmon\n", "1\n")
    expect { subject.start }.to output(/Salmon added/).to_stdout
  end

  it 'should add a pizza' do
    allow(basket).to receive(:add)
    allow(subject).to receive(:gets).and_return("3\n", "bufala\n", "1\n")
    expect { subject.start }.to output(/Bufala added/).to_stdout
  end

  it 'should add a pasta' do
    allow(basket).to receive(:add)
    allow(subject).to receive(:gets).and_return("3\n", "lasagna\n", "1\n")
    expect { subject.start }.to output(/Lasagna added/).to_stdout
  end

  it 'should add a drink' do
    allow(basket).to receive(:add)
    allow(subject).to receive(:gets).and_return("3\n", "water\n", "1\n")
    expect { subject.start }.to output(/Water added/).to_stdout
  end

  it 'should not add a dish not on the menu' do
    allow(basket).to receive(:add)
    allow(subject).to receive(:gets).and_return("3\n", "curry\n", "1\n")
    expect { subject.start }.to output(/don't serve/).to_stdout
  end

  it 'should ask for the correct option' do
    allow(subject).to receive(:gets).and_return("nope!\n")
    expect { subject.start }.to output(/correct option/).to_stdout
  end
end

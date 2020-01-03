require 'order'

describe Order do
  let(:text) { double(:text, send_text: true) }
  let(:basket) { double(:basket, :basket => [{ bufala: 10 }, { bufala: 10 }, { bufala: 10 }]) }

  subject { described_class.new(text) }

  it 'should calculate the total from the basket' do
    expect(subject.total(basket)).to eq 30
  end

  it 'should place the order' do
    allow(basket).to receive(:empty?) { false }
    allow(basket).to receive(:clear)
    allow(subject).to receive(:gets).and_return("yes\n")
    message = "order is placed"
    expect { subject.checkout(basket) }.to output(/#{message}/).to_stdout
  end

  it 'should not place the order' do
    allow(basket).to receive(:empty?) { false }
    allow(subject).to receive(:gets).and_return("no\n")
    message = "order is not placed"
    expect { subject.checkout(basket) }.to output(/#{message}/).to_stdout
  end

  it 'should not proceed if the basket is empty' do
    allow(basket).to receive(:empty?) { true }
    message = "Your basket is empty, can't proceed with checkout"
    expect { subject.checkout(basket) }.to output(/#{message}/).to_stdout
  end
end

require 'printer'

describe Printer do
  let(:list) { double(:bolognese, :list => { pasta: { bolognese: 10 } }) }
  let(:basket) { double(:basket, :basket => [{ bolognese: 10 }, { bufala: 12 }]) }

  it 'should print a list of dishes' do
    expect { subject.print(list) }.to output(/Bolognese/).to_stdout
  end

  it "should print the basket" do
    expect { subject.view_basket(basket) }.to output(/Bufala/).to_stdout
  end
end

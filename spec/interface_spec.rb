require 'interface'

describe Interface do
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

  # it 'should print the basket' do
  #   allow(subject).to receive(:gets).and_return("2\n")
  #   expect { subject.start }.to output("something").to_stdout
  # end

  # it 'should add an item to the basket' do
  #   allow(subject).to receive(:gets).and_return("3\n")
    # subject.start
    # allow(subject).to receive(:gets).and_return("salmon\n")
    # allow(subject).to receive(:gets).and_return("2\n")

  #   expect { subject.start }.to output("something").to_stdout
  # end  
end

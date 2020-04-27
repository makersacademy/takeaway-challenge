require 'interface'

describe Interface do

  it "Is able to call on the takeaway menu." do
    expect(subject.food).to receive(:menu)
    subject.food_menu
  end

  it "Is able to display the options_menu." do
    options = "------------------------------------------\n1. Place your order\n2. View your order\n9. Exit\n"
    expect { subject.options_menu }.to output(options).to_stdout
  end

  it "Is able to accept user input '1' and call on :place_order." do
    expect(subject).to receive(:place_order)
    subject.input("1")
  end

  it "Is able to accept user input '2' and call on :order_confirmation." do
    expect(subject).to receive(:order_confirmation)
    subject.input("2")
  end

  it "Is able to accept user input '9' and exit interface with 'Goodbye'." do
    expect { subject.input("9") }.to output("Goodbye\n").to_stdout
    rescue SystemExit
  end

  it "Is able to ignore erroneous input and ask the user to 'try again'. " do
    $stdout = StringIO.new
    subject.input("foo")
    $stdout.rewind
    expect($stdout.gets.strip).to include("try again")
    $stdout = STDOUT
  end

  it "is able to display interactive takeaway menu, accept input and exit." do
    expect { subject.input("9") }.to output("Goodbye\n").to_stdout
    subject.interactive_menu
    rescue SystemExit
  end
end

require 'interface'

describe Interface do

  it "Is able to call on the takeaway menu" do
    expect(subject.food).to receive(:menu)
    subject.food_menu
  end

  it "Is able to display the options_menu" do
    options = "------------------------------------------\n1. Place your order\n2. View your order\n9. Exit\n"
    expect{subject.options_menu}.to output(options).to_stdout
  end

end

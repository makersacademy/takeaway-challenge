require "menu"

RSpec.describe Menu do
  it "can print the list of dishes and prices" do
    expected_output = <<~OUTPUT
      * bruschetta: £3
      * spaghetti carbonara: £8
    OUTPUT

    expect { subject.print }.to output(expected_output).to_stdout
  end

  it "has bruschetta" do
    expect(subject.dish?("bruschetta")).to be_truthy
  end

  it "has spaghetti carbonara" do
    expect(subject.dish?("spaghetti carbonara")).to be_truthy
  end

  it "does not have dishes that are not on the menu" do
    expect(subject.dish?("unknown dish")).to be_falsey
  end

  it "knows the price of bruschetta" do
    expect(subject.price("bruschetta")).to eq(3)
  end

  it "knows the price of spaghetti carbonara" do
    expect(subject.price("spaghetti carbonara")).to eq(8)
  end

  it "does not know the price of dishes that are not on the menu" do
    expect { subject.price("unknown dish") }.
      to raise_error("'unknown dish' is not on the menu")
  end
end

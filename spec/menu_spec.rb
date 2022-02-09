require "menu"

describe Menu do

  let(:curry) { double :curry, :name => "curry", :price => 8.5 }
  let(:naan) { double :naan, :name => "naan", :price => 3 }

  it "should be able to add a dish" do
    subject.add(curry)
    expect(subject.dishes).to match_array([curry])
  end

  it "should be able to add multiple dishes" do
    subject.add(curry)
    subject.add(naan)
    expect(subject.dishes).to match_array([curry, naan])
  end

  context "dishes on menu" do

    before do
      subject.add(curry)
      subject.add(naan)
    end

    it "should be able to show a list of dishes and prices" do
      expect { subject.show }.to output("curry, £8.5\nnaan, £3\n").to_stdout
    end

  end

end

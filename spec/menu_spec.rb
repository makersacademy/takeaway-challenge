require 'menu'

describe Menu do

  it { is_expected.to respond_to :show }

  it { is_expected .to respond_to(:choose).with(2).arguments }

  it "can select a menu item" do
    subject.choose 1, :pizza
    expect(subject.selections).to eq ({pizza: 1})
  end

  it "can select different items" do
    subject.choose 1, :pizza
    subject.choose 1, :beer
    expect(subject.selections).to eq ({pizza: 1, beer: 1})
  end

  it "can have more than one of an item" do
    subject.choose 2, :pizza
    expect(subject.selections).to eq ({pizza: 2})
  end

  it "can select an item more than once" do
    2.times {subject.choose 1, :pizza}
    expect(subject.selections).to eq ({pizza: 2})
  end



end
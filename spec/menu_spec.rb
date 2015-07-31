require 'menu'

describe Menu do

  let(:text_sender) { double :text_sender }

  subject { Menu.new text_sender }

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

  it "can calculate total price of order with one item" do
    subject.choose 1, :pizza
    expect(subject.total).to eq "£9.99"
  end

  it "can calculate total price of order with multiple items" do
    subject.choose 2, :pizza
    subject.choose 4, :beer
    expect(subject.total).to eq "£31.54"
  end

  it "sends the number and message to text_sender" do
    phone_number = "447963648096"
    time =  Time.new 2015, 6, 21, 18, 03
    allow(Time).to receive(:new) { time }
    expect(text_sender).to receive(:send_text).with("447963648096", "Thanks! Your order should be delivered before 19:03, The total is £0.00.")
    subject.order(phone_number)

  end



end
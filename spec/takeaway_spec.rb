require 'takeaway'

describe TakeAway do
  subject(:takeaway) {described_class.new}
  before do
    takeaway.order 'spring roll'
    takeaway.order 'spring roll'
    takeaway.order 'spring roll', 4
    allow(takeaway).to receive(:send_text)
  end

  it "shows the menu list" do
    menu_list = {"spring roll"=>0.99, "char sui bun"=>3.99, "pork dumpling"=>2.99, "peking duck"=>7.99, "fu-king fried rice"=>5.99}
    expect(takeaway.read_menu).to eq menu_list
  end

  it "takes the order" do
    expect(takeaway.order("spring roll")).to eq "1x spring roll(s) added to your basket."
    expect(takeaway.order("char sui bun",2)).to eq "2x char sui bun(s) added to your basket."
  end

  it "takes the order summary" do
    expect(takeaway.basket_summary).to eq "spring roll x4 = £3.96"
  end
  it "doesn't take the same order " do
    expect(takeaway.basket_summary).to eq "spring roll x4 = £3.96"
  end

  it "adds multiple orders" do
    takeaway.add 'pork dumpling', 3
    expect(takeaway.basket_summary).to eq "spring roll x4 = £3.96, pork dumpling x3 = £8.97"
  end

  it "adds multiple orders" do
    takeaway.add 'pork dumpling', 3
    expect(takeaway.basket_summary).to eq "spring roll x4 = £3.96, pork dumpling x3 = £8.97"
  end

  it "shows the total of the order" do
    takeaway.add 'pork dumpling', 3
    expect(takeaway.total).to eq 12.93
  end

  context "checking out" do

    before do
      takeaway.basket_summary
      takeaway.add 'pork dumpling', 3
      total = takeaway.total
    end

    it "checkouts the order" do
      expect(takeaway.checkout(12.93)).to eq nil
    end
    it "raises an error if the total is not correct " do
      expect{takeaway.checkout(12)}.to raise_error("The total is not correct.")
    end

    it "sends a payment confirmation text message" do
      t = (Time.now + 1*60*60)
      allow(takeaway).to receive(:send_text).with("Thank you for your order: £#{takeaway.total}. It will be delivered before #{t.hour}:#{t.min}")
      takeaway.checkout(12.93)
      expect(takeaway).to have_received(:send_text).with("Thank you for your order: £#{takeaway.total}. It will be delivered before #{t.hour}:#{t.min}")
    end

  end

end

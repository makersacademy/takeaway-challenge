require "takeaway"

describe Takeaway do

  subject(:takeaway) { described_class.new(menu, twilio) }
  let(:dishes_r){ {
    'hamburger' => 2,
    'pasta'     => 4,
    'burrito'   => 3,
    'lasagna'   => 5
  } }
  let(:dish){'hamburger'}
  let(:sel_dish){{'hamburger' => 4}}
  let(:total_cost){16}
  let(:end_order){'end'}
  let(:twilio){ double :twilio}
  let(:menu){ double :menu}


  it "expect takeaway to print the menu" do
    allow(menu).to receive(:dishes).and_return(dishes_r)
    expect(takeaway.menu_restaurant).to eq(dishes_r)
  end

  it "expect to select more quantity of the same item" do
    allow(menu).to receive(:dishes).and_return(sel_dish)
    subject.select_dishes(dish, 4)
    expect(takeaway.selected_dishes).to eq(sel_dish)
  end

  it "expect to calculate the total of the ordered dishes" do
    allow(menu).to receive(:dishes).and_return(sel_dish)
    subject.select_dishes(dish, 4)
    expect(subject.total).to eq(total_cost)
  end

  it "expect to close the program" do
    allow(subject).to receive(:send_message)
    begin
      subject.pay(0)
      rescue SystemExit
    end
  end

end

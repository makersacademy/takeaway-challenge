require 'order'

describe Order do
  it "Has a method select dishes with 2 arguments"do
    expect(subject).to respond_to(:select_dishes).with(3).arguments
  end

  it "Can select a number dishes off the menu" do
    subject.select_dishes("hamburger", 6.0, 2)
    expect(subject.ticket).to eq [ { "hamburger" => 6.0 } , { "hamburger" => 6.0 } ]
  end

  it "can display the order total" do
    subject.select_dishes("hamburger", 6.0, 2)
    expect(subject.sum_order).to eq 12.00
  end
end

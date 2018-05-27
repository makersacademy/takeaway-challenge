require "ordering_interface.rb"
require "time"

describe OrderingInterface do

  it "#order - regular case" do
    expect(
      subject.order(
        {
          gelatinous_grime_goulash: 2,
          reeking_rat_ravioli: 1,
          slug_slime_secretion_soup: 2,
          total: 5
        }
      )
    ).to eq "Thank you! Your order was placed and will be delievered before #{Time.now.strftime('%H:%M')}."
  end

  it "#order - no total given" do
    expect {
      subject.order(
        {
          gelatinous_grime_goulash: 2,
          reeking_rat_ravioli: 1,
          slug_slime_secretion_soup: 2
        }
      )
    }.to raise_error "No total given!"
  end

  it "#order - total doesn't match" do
    expect {
      subject.order(
        {
          gelatinous_grime_goulash: 2,
          total: 3
        }
      )
    }.to raise_error "Total doesn't match!"
  end

  it "#order - unknown dish" do
    expect {
        subject.order(
          {
            gelatinous_grime_goulash: 2,
            spaghetti_bolognese: 1,
            total: 3
          }
        )
      }.to raise_error "Unknown dish!"
  end

  it "#menu - show menu with prices" do
    expect(subject.menu).to eq described_class::HORRID_DISHES
  end

  # it "#send_sms - should return string" do
  #   allow(subject)
  #     .to receive(:send_sms)
  #     .with("hello")
  #     .and_return("hello")
  #   expect(subject.send_sms("hello")).to eq "hello"
  # end



end
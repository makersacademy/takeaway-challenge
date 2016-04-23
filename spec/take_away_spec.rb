require 'takeaway'

describe TakeAway do
  subject (:take_away) { described_class.new }

  it 'presents a list of dishes with prices' do
    expect(take_away.dishes).to include (:hamburger)
    expect(take_away.dishes).to include (:pizza_deluxe)
  end

  it 'allows users to select how many dishes to order out of each dish' do
    order = { hamburger: 1, pizza_deluxe: 2 }
    take_away.select(:hamburger, 1)
    take_away.select(:pizza_deluxe, 2)
    expect(take_away.order).to eq order
  end

end

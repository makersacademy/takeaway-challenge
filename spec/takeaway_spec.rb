require './takeaway'

describe 'takeaway' do

  # let (:diary_not_locked) { double :secure, :secure? => false }
  let (:dishes) { Dishes.new }

  it 'prints a list of dishes with prices' do
    expect(dishes.display).not_to eq nil
  end

end

require 'takeaway'

describe Takeaway do

  it 'oyster card displays balance' do 

    expect(subject.menu).to eq({ :"Chicken tikka" => 5, :"Chicken Korma" => 4.50, :"Chicken Jalfrezi" => 5.20 })

  end
end

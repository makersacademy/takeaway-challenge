require 'takeaway'

describe Takeaway do

let (:menu) {double(:menu)}
let (:subject) {described_class.new(menu)}

  it 'displays a menu' do
    expect(subject.list_menu).to eq menu
  end


end

require 'interface'

describe Interface do

  it "Is able to call on the takeaway menu" do
    expect(subject.food).to receive(:menu)
    subject.food_menu
  end

end

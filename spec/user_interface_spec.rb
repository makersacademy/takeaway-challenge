require 'user_interface'

describe UserInterface do
  subject { described_class.new }

  it {is_expected.to respond_to :introduction}

  it {is_expected.to respond_to :launch!}

  it "has a list of options" do
    expect(subject.choices).to include "view menu"
  end




end

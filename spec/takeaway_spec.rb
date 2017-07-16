require './lib/takeaway.rb'
require './lib/menu.rb'

RSpec.describe Takeaway do
let(:subject) { Takeaway.new }
let(:menu) { double(Menu::BURGERS) }
 
  it { expect(subject).to respond_to(:menu) }
  it { expect(subject).to respond_to(:welcome) }
  it "displays menu" do
     expect(subject.menu).not_to be_empty
  end

  it "dispays welcome message and checks if its a string" do
    expect((subject.welcome).class).to eq String
  end
  
end

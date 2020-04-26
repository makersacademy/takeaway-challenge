require "customer_selection"
require "stringio"

describe CustomerSelection do
  let(:subject) { described_class.new }
  let(:dish) { "croissant" }
  let(:quantity) { 1 }

  it "responds to selection_process method" do
    expect(subject).to respond_to(:select_dish) 
  end
  
  describe "#select_dish" do
    let(:input) { StringIO.new("croissant") }
    it "receives user input - dish" do
      $stdin = input
      expect { subject.select_dish }.to output("Please enter dish:\n").to_stdout
      $stdin = STDIN
    end
  end
  
  describe "#select_quantity" do
    let(:input) { StringIO.new("1") }
    it "receives user input - quantity" do
      $stdin = input
      expect { subject.select_quantity }.to output("Please enter quantity:\n").to_stdout
      $stdin = STDIN
    end
  end

  describe "#select_continue" do
    let(:input) { StringIO.new("1") }
    it "receives user input - continue" do
      $stdin = input
      expect { subject.select_continue }.to output("Continue?\n").to_stdout
      $stdin = STDIN
    end
  end

  before do
    allow($stdout).to receive(:write)
  end
  
  describe "#place_order" do
    let(:input1) { StringIO.new("croissant\n 2\n Y\n juice\n 3\n N\n") }
    it "receives user input - dish" do
      $stdin = input1
      expect { subject.place_order }.to output("Please enter dish:\nPlease enter quantity:\nContinue?\nPlease enter dish:\nPlease enter quantity:\nContinue?\n").to_stdout
      $stdin = STDIN
    end
  end
  
  describe "#print_order" do
    it "prints selected dishes" do
      expect(subject.print_order).to be_kind_of(Hash)
    end
  end
  
end
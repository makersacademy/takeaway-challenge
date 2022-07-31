require "./lib/menu.rb"

describe Menu do
  describe "display_menu" do  
    it "responds to display_menu" do
      expect(subject).to respond_to(:display_menu)
    end


    it "to display the price of meal 1" do
        expect(subject.display_menu['1. meal1']).to eq 10
    end

    it "to display the price of meal 2" do
        expect(subject.display_menu['2. meal2']).to eq 20
    end

    it "to display the price of meal 3" do
      expect(subject.display_menu['3. meal3']).to eq 30
    end

    it "to display the price of meal 4" do
      expect(subject.display_menu['4. meal4']).to eq 40
    end

    it "to display the price of meal 5" do
        expect(subject.display_menu['5. meal5']).to eq 50
    end

  end


end
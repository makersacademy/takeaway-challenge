require 'menu'

describe Menu do

  let(:menu) { ["Parhelic Triangle - £8.95",
                "Theme of Sudden Roundabout - £10.52",
                "Hello Meow - £11.23",
                "Homemade Polysynth - £9.91",
                "Disturbed Mammoth - £10.25",
                "Bodmin Moor 1932 - £9.96",
                "Slate-Coloured Storm - £9.25",
                "Perforated Air - £9.98",
                "Droplet Mirror - £9.55",
                "Solo Barn Dance - £9.25",
                "Wavfile Dayjob - £9.25",
                "Vanilla - £11.52"].join("\n")
            }

  describe "display_menu" do
    it "displays the menu" do
      expect { subject.show_menu }.to output(/#{menu}$/).to_stdout
    end
  end

end

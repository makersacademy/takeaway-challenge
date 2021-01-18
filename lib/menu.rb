class Menu

  def dishes
    @dishes = {
      "Parhelic Triangle" => 8.95,
      "Theme of Sudden Roundabout" => 10.52,
      "Hello Meow" => 11.23,
      "Homemade Polysynth" => 9.91,
      "Disturbed Mammoth" => 10.25,
      "Bodmin Moor 1932" => 9.96,
      "Slate-Coloured Storm" => 9.25,
      "Perforated Air" => 9.98,
      "Droplet Mirror" => 9.55,
      "Solo Barn Dance" => 9.25,
      "Wavfile Dayjob" => 9.25,
      "Vanilla" => 11.52 }
    end


  def show_menu
    dishes
    @dishes.each { |item, price| puts "#{item} - £#{price}" }
  end

  def on_menu?(dish)
    dishes
    @dishes.include?(dish)
  end

end

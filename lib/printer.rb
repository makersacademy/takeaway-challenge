class Printer

  def initialize
    @title = "DDs VEGERAMA"
    @split = "----------------------------------------"
  end

  def formatter(document)
    puts ""
    puts ""
    puts ""
    puts @title.center(40)
    puts @split.center(40)
    document.each do |selection|
      puts selection.values.map { |x| x.to_s }.pack("A39A")
    end
    puts ""
    puts ""
    puts ""
  end
end

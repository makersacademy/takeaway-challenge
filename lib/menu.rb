class Menu
  # attr_reader :contents

  def initialize
    contents
  end

  def contents
    @contents = { 'fish' => 5, 'chips' => 6 }
  end


   def display_menu
    @contents.each do |key, value|
      puts key + ": £" + value.to_s
    end
    end
end

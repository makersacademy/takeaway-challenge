class Menu

  attr_reader :options

  def initialize
    @options =   {
        :prawn_crackers => 1.95,
        :prawn_summer_roll => 4.95,
        :vegetable_spring_rolls => 3.95,
        :tom_yam_soup => 4.95,
        :green_curry => 6.95,
        :pad_thai => 6.95,
        :steamed_rice => 2.25
        }
  end

end

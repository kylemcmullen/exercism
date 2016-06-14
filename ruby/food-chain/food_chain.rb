module BookKeeping
  VERSION=2
end
module FoodChain

  LINE_FOR_THING = {
    'bird' => "How absurd to swallow a bird!\n",
    'cat' => "Imagine that, to swallow a cat!\n",
    'dog' => "What a hog, to swallow a dog!\n",
    'goat' => "Just opened her throat and swallowed a goat!\n",
    'cow' => "I don't know how she swallowed a cow!\n"
  }

  THINGS = ['fly','spider','bird','cat','dog','goat','cow','horse']

  def self.song
  	song = ''
  	things = []
  	remaining_things = THINGS.clone
  	loop do
  		things = things.unshift(remaining_things.shift)
	    if things.size == 1
	      song += intro_verse(things)
	    elsif things.size == 2
	      song += special_verse(things)
	    elsif remaining_things.empty?
	      song += outro_verse(things)
	      break
	    else
	      song += internal_verse(things)
	    end 
	    song += "\n"
  	end
  	song
  end

  private 

  def self.intro_verse(things)
    "I know an old lady who swallowed a #{things[0]}.\n"+
    "I don't know why she swallowed the #{things[0]}. Perhaps she'll die.\n"
  end

  def self.special_verse(things)
	"I know an old lady who swallowed a #{things[0]}.\n" +
	"It wriggled and jiggled and tickled inside her.\n" +
	"She swallowed the #{things[0]} to catch the #{things[1]}.\n" +
	"I don't know why she swallowed the #{things[1]}. Perhaps she'll die.\n"
  end

  def self.internal_verse(things)
    verse = "I know an old lady who swallowed a #{things[0]}.\n" +
    LINE_FOR_THING[things[0]]
    for i in 0.upto(things.size - 4)
      verse += "She swallowed the #{things[i]} to catch the #{things[i+1]}.\n"
    end
    verse += "She swallowed the #{things[-3]} to catch the #{things[-2]} that wriggled and jiggled and tickled inside her.\n"
    verse += "She swallowed the #{things[-2]} to catch the #{things[-1]}.\n"
    verse += "I don't know why she swallowed the #{things[-1]}. Perhaps she'll die.\n"

    verse
  end

  def self.outro_verse(things)
    "I know an old lady who swallowed a #{things[0]}.\n" +
    "She's dead, of course!\n"
  end

end
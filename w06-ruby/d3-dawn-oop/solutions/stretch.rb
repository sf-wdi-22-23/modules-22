class Monster

  # class constant - freeze freezes the value of an array or hash
  THREAT_LEVELS = [:low, :medium, :high, :midnight].freeze

  # getters and setters for instance variables
  attr_accessor :threat_level, :habitat, :name

  # class variable
  @@count = 0

  # class instance variable
  @class_description = "A scary monster!"

  # class method getter for @@count class variable
  def self.count
    @@count
  end

  # class method getter for @class_description class instance variable
  def self.class_description
    @class_description
  end

  # initial behavior
  def initialize(threat_level=:medium)
  	# check that threat_level argument is valid
    if THREAT_LEVELS.include? threat_level
      @threat_level = threat_level
    else
      raise "cannot create monster - invalid threat level #{threat_level}"
    end
    # other initialization tasks
    puts "Rawr!"
    @@count = @@count + 1
    puts "#{@@count} monsters now roam the world!"
  end


  # custom setter to restrict possible threat levels
  def threat_level=(new_threat_level)
  	# check that threat_level argument is valid
    if Monster::THREAT_LEVELS.include? threat_level
      @threat_level = threat_level
    else
      raise "cannot set threat level to #{new_threat_level} - invalid"
    end
  end

  # instance method
  def habitat?(some_hab)
    @habitat == some_hab
  end
  
  # instance method
  def get_dangerous
    # ruby version of a switch statment uses case
    case @threat_level
      when :low
        @threat_level = :medium
      when :medium
        @threat_level = :high
      when :high
        @threat_level = :midnight
      when :midnight
        :midnight
    end
  end

  include Comparable
  def <=>(other_monster)
    Monster::THREAT_LEVELS.index(@threat_level) <=> Monster::THREAT_LEVELS.index(other_monster.threat_level)
  end

  # class method
  def self.fight(monster1, monster2)
  	# ruby has a ternary operator 
    monster1 > monster2 ? monster1 : monster2
  end
end


class Zombie < Monster

  # zombie version of class_description
  @class_description = "Shuffling, decaying flesh. Hungry and without remorse!"

  # we'll use the reserved word super
  # to call Monster's initialize and keep our code more DRY
  def initialize (threat_level=:medium)
    # note that zombies created without a threat level
    # will have a default threat_level of :medium
    super(threat_level)  
    @habitat = "graveyard"
  end
end

class Werewolf < Monster
  # werewolf version of class_description
  @class_description = "A man... a wolf... a monster!"

  def initialize (threat_level=:low)
    # werewolves created without a threat level
    # will have a default threat_level of :low
    super(threat_level)  
    @name = name
  end

  def update_threat_level(full_moon)
    if full_moon
      @threat_level = :midnight
    else
      @threat_level = :low
    end
    @threat_level
  end
end



module Flying
  def fly
    puts "#{self.name || "it"} soars through the air"
  end
end

class Vampire < Monster
  @class_description = "Dark and sparly."
  include Flying
end

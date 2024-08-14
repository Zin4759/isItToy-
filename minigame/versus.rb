class Character
  attr_accessor :name, :hit_point, :attack_point
  def initialize(name, hit_point, attack_point)
    @name = name
    @hit_point = hit_point
    @attack_point = attack_point
  end

  def hit_point
    return @hit_point
  end
end

class BattleField
  attr_accessor :participents
  def initialize
    @participents = {}
  end

  def join_to_battle(user)
    @participents[user.name] = [user.hit_point, user.attack_point]
  end
  
  def to_s
    @participents.map do |name, stats|
      "#{name}: HP #{stats[0]}, AP #{stats[1]}"
    end.join("\n")
  end

  def judge_to_retire
    retired = false
    @participents.each do |name, stats|
      if stats[0] < 0
        retired = true
        print "#{name} is retire!\n"
      end
    end
  end

  def attack_to_other_person(attacker, target)
    @participents[String(target)][0] = @participents[String(target)][0] - @participents[String(attacker)][1]
    puts "#{attacker} attack to #{target}!\n"
    puts "Now, #{target}'s hp is #{@participents[target][0]}!"
    judge_to_retire
  end

  def attack_each_other(person1, person2)
    # using it "only" two object
    @participents[String(person1)][0] = @participents[String(person1)][0] - @participents[String(person2)][1]
    @participents[String(person2)][0] = @participents[String(person2)][0] - @participents[String(person1)][1]
    puts "#{person1} and #{person2} attack each other on same time!\n"
    puts "Now here, #{person1}'s hp is #{@participents[person1][0]}!"
    puts "And then, #{person2}'s hp is #{@participents[person2][0]}!"
    judge_to_retire
  end
end

bf = BattleField.new
aai = Character.new("Aai", 55, 48)
serina = Character.new("Serina", 60, 54)
bf.join_to_battle(aai)
bf.join_to_battle(serina)
puts bf.to_s
puts "Battle start!"
# bf.attack_to_other_person("Serina", "Aai")
# bf.attack_to_other_person("Aai", "Serina")
# bf.attack_each_other("Serina", "Aai")
bf.attack_to_other_person("Aai", "Serina")
bf.attack_each_other("Serina", "Aai")
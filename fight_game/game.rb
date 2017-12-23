

class Player
    attr_accessor :name, :health, :power
    def initialize(n, h, pow)
        @name = n
        @health = h
        @power = pow
    end
    def isAlive
        @health > 0
    end
    def hit(opponent)
        opponent.health -= self.power
    end
    def to_s
        "#{name}: Health: #{health}, Power: #{power}"
    end
end

def fight(p1, p2)
    while p1.isAlive && p2.isAlive
        p1.hit(p2)
        p2.hit(p1)
        
        show_info(p1, p2)
    end
    
    if p1.isAlive 
        puts "#{p1.name} WON!" 
    elsif p2.isAlive
        puts "#{p2.name} WON!" 
    else
        puts "TIE!"
    end
end

def show_info(*p)
    p.each { |x| puts x}
end

#initialize Players
puts "PLAYERS INFO"
p1name = gets.chomp
p1 = Player.new(p1name, 1+rand(100), 1+rand(20))
p2 = Player.new("Player 2", 1+rand(100), 1+rand(20))

#show Player info
show_info(p1, p2)

puts "LETS FIGHT!"
fight(p1, p2)

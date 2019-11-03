class Follower
    attr_accessor :name, :age, :life_motto, :cult
    @@all_followers = []

    def initialize(name, age, life_motto)
        @name = name
        @age = age
        @life_motto = life_motto
        @@all_followers << self
    end

    def self.all_followers
        @@all_followers
    end

    def join_cult(initiation_date, cult)
        Initiation.new(initiation_date, self, cult)
    end

    def initiations
        Initiation.all_initiations.select do |each| 
            each if each.follower.name == self.name
        end
    end

    # take all initiations and select cults for a follower
    # couldn't do it in one step, crated initations helper method
    def cults
        self.initiations.map do |each| 
            each.cult if each.follower.name == self.name
        end
    end

    def self.of_a_certain_age(fixnum)
        all_followers.select do |each|
            each.age >= fixnum
        end
    end

    # take array of all cults
    # pull slogan for each

    def my_cults_slogan
        self.cults.map do |each|
            each.slogan
        end
    end

    def self.most_active
        max_cults = Follower.all_followers.map do |each|
            each.cults.count
        end.max
         
        Follower.all_followers.select do |each| 
            each.name if each.cults.count == max_cults
        end
    end

    # pull all followers
    # add # cults for each
    # sort by max and cut off at 10
    def self.top_ten 
        ppl = Follower.all_followers 
        # num_cults =  
        
        freq = ppl.inject(Hash.new(0)) do |k,v|
            k[v] = v.cults.count;
            k
        end

        ppl.max_by(10) do |v| 
            freq[v]
        end
    end

end


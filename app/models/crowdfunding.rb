class User

    attr_accessor :name

    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def create_project(title)
        Project.new(title, self)
    end

    def back_project(project,amount)
        Pledge.new(Project.all.select{|p| p.name == project},amount,self)
    end

    def self.highest_pledge
    max = 0
    user = []
        Pledge.all.each do |pledge|
            if pledge.amount > max
                max = pledge.amount
                user = pledge.user
            end
        end
        user
    end

    def pledge_count
        count = 0
        Pledge.all

    end

    def self.multi_pledger
    # returns all users who have pledged to multiple projects

        User.all.select do |user|
            Pledge.all.select do |pledge|
                pledge.user == user
            end
        end
    end

    def self.project_creator
        Project.all.select do |project|
            project.creator.name
        end
    end

    def self.all
        @@all
    end
end

class Project

    attr_accessor :name, :creator, :goal

    @@all = []

    def initialize(name,creator,goal)
        @name = name
        @creator = creator
        @goal = goal
        @@all << self
    end

    def self.no_pledges
        allprojects = []
        Pledge.all.each {|pledge| allprojects << pledge.project}
        Project.all.select {|project| allprojects.include?(project) == false}
    end

    def total_pledged
        total = 0

        Pledge.all.each do |pledge|
            if pledge.project == self
                total += pledge.amount
            end
        end
        total
    end

    def self.above_goal
        Project.all.select do |project|
            project.total_pledged >= project.goal
        end
    end

    def self.most_backers
        names = []
        max = 0
        most = ""
        Pledge.all.each {|pledge|
            names << pledge.project.name
    }
        names.each do |x|
            if names.count(x) > max
                max = names.count(x)
                most = x
            end
        end
        Project.all.select {|project| project.name == most}
    end

    def self.all
        @@all
    end
end


class Pledge

    attr_accessor :project, :amount, :user

    @@all = []

    def initialize(project, amount, user)
        @project = project
        @amount = amount
        @user = user
        @@all << self
    end

    def self.all
        @@all
    end
end

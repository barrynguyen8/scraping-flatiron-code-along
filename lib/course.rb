class Course
    attr_accessor :title, :schedule, :description #define getter and setter course instance methods
    
    @@all = [] # class variable is an empty array 
    
    def initialize #constructor - when ruby creates a new object, it executes this 'constructor' instance method to put default values into instance variables 
        @@all << self #when a class of this instance is initialized, it will be pushed to the @all class variable 
    end

    def self.all #class method - returns an array of all the instances of the Course class
        @@all
    end

    def self.reset_all #class method
        @@all.clear
    end
    
end 


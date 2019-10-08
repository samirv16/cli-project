require 'pry'
require 'nokogiri'
require 'open-uri'

class Team
    
    @@all = []
    
    attr_reader :name 
    
    def initialize(name)
      @name = name 
      @@all << self
    end 
    
  
  def self.all
    @@all
  end
  
  
  
    # binding.pry
    
    
end 
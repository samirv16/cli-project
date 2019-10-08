require 'pry'
require 'nokogiri'
require 'open-uri'

class Team
    
    @@all = []
    
    attr_accessor :name, :description
    
    def initialize(name, description)
      @name = name
      @description = description 
      @@all << self
    end 
    
  
  def self.all
    @@all
  end
  
  
  
    # binding.pry
    
    
end 
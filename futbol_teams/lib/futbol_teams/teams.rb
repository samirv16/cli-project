require 'pry'
require 'nokogiri'
require 'open-uri'

class Team
    
    @@all = []
    
    attr_accessor :description, :url
    attr_reader :name 
    
    def initialize(name, url)
      @name = name
      @url = url
      @@all << self
      @description = nil 
    end 
    
  
  def self.all
    @@all
  end
  
  
  
    # binding.pry
    
    
end 
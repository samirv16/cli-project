require 'pry'

class FutbolTeams::CLI
  
  def call
    puts "News headlines available for the following 10 futbol teams:"
    list_teams
    menu
    bye
  end
  
  def list_teams
    # puts "10 most popular futbol teams:"
      @teams = FutbolTeams::Teams.all
      @teams.each.with_index(1) do |team, i|
        puts "#{i}. #{team}"
      end
  end
  
  def menu
    input = nil
    while input != "exit"
    first_msg = "enter number for which team youd like to see news headlines, type list to see teams again, or type exit:"
    puts first_msg
      input = gets.strip.downcase
      
      if input.to_i > 0 
        the_team = @teams[input.to_i-1]
        puts the_team.headlines
      elsif input == "list"
        list_teams
      else
        puts "That's not an option, please try again:"
      # case input 
      #   when "1"
      #   puts "news headlines for team 1"
      #   when "2"
      #   puts "news headlines for team 2"
      #   when "3"
      #   puts "news headlines for team 3"
      #   when "4"
      #   puts "news headlines for team 4"
      #   when "5"
      #   puts "news headlines for team 5"
      #   when "6"
      #   puts "news headlines for team 6"
      #   when "7"
      #   puts "news headlines for team 7"
      #   when "8"
      #   puts "news headlines for team 8"
      #   when "9"
      #   puts "news headlines for team 9"
      #   when "10"
      #   puts "news headlines for team 10"
      #   when "list"
      #     list_teams
      #   else 
      #     puts "That's not an option, please try again."
      end
    end 
  end 
  
  def bye
    puts "Bye Felicia!"
  end 
  
end
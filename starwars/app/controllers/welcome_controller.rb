class WelcomeController < ApplicationController

  def index
    sql_query = "select * from star_wars order by character asc"
    @characters = ActiveRecord::Base.connection.execute(sql_query)
    # turn the 'dumb' hash data into an object

    @characters = @characters.map do |hash|
      character = Character.new
      character.id = hash["id"]
      character.character = hash["character"]
      character.planet = hash["planet"]
      character.vehicle = hash["vehicle"]
      character.quote = hash["quote"]
      character
    end
  end
end

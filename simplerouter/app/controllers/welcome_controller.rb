class WelcomeController < ApplicationController

  def index
    quotes = [
      "JWo Rules",
      "Party Time, Excellent",
      "Be Excellent to Each Other",
      "Stop trying to make fetch happen"
    ]

    # @quote = quotes.sample

    @quote = Faker::Hipster.paragraph

    @contacts = []
    5.times do
      @contacts << Faker::Name.name
    end
  end

  def yolo
  end

  def gifs
    @photo_urls = [
      "https://media.giphy.com/media/cYYx0b3DcYwOA/giphy.gif",
    ]
  end
end

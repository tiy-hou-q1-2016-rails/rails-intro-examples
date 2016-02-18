class LabsController < ApplicationController

  def index
    @name = "JWo"

    @labs = fetch_labs
  end

  def view
    @labs = fetch_labs

    @lab = @labs.find {|l| l.id == params[:id].to_i }

  end

  def fetch_labs
    [
      Lab.new(1, "T-Shirts"),
      Lab.new(2, "Planet Express (CSV to HTML)"),
      Lab.new(3, "Mallory Furniture (CSV in Rails)"),
      Lab.new(4, "Reddit Lab")

    ]
  end
end

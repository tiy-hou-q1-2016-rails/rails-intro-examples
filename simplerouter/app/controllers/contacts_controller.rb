class ContactsController < ApplicationController
  def view
    @name = params[:name]
  end
end

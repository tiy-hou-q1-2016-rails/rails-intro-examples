require 'csv'

class ContactsController < ApplicationController
  def list
    @contacts = fetch_contacts

    if params[:search_text].present?
      @contacts = @contacts.select do |contact|
        contact.full_name.downcase.include? params[:search_text].downcase
      end
    end
  end

  def view
    @contact = fetch_contacts.find{|contact| contact.id == params[:id].to_i }
  end

  def fetch_contacts
    id = 1
    contacts = []
    CSV.foreach("contacts.csv", headers: true) do |row|
      contact_hash = row.to_hash

      contact = Contact.new
      contact.id = id
      contact.first_name = contact_hash["First Name"]
      contact.last_name = contact_hash["Last Name"]
      contact.email = contact_hash["Email"]
      contact.company_name = contact_hash["Company Name"]
      contact.phone_number = contact_hash["Phone Number"]
      contact.photo_url = contact_hash["Photo Url"]
      contacts << contact
      id += 1
    end

    # sort contacts by last name
    contacts = contacts.sort {|x, y| x.last_name <=> y.last_name }

  end

end

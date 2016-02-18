class Contact
  attr_accessor :id, :first_name, :last_name, :email,
                :company_name, :phone_number, :photo_url

  def full_name
    "#{last_name}, #{first_name}"
  end
end

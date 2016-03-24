class ContactsController < ApplicationController
  # index
  def index
    # @contacts = Contact.all
    @person = Person.find(params[:person_id])
    @contacts = @person.contacts
  end

  # new
  def new
    @person = Person.find(params[:person_id])
    @contact = Contact.new
  end

  # create
  def create
    @person = Person.find(params[:person_id])
    @contact = @person.contacts.create(contact_params)
    redirect_to person_path(@person)
  end


  def show
    @person = Person.find(params[:person_id])
    @contact = @person.contacts.find(params[:id])
  end

  # edit
  def edit
    @person = Person.find(params[:person_id])
    @contact = @person.contacts.find(params[:id])
  end

  # update
  def update
    @contact = Contact.find(params[:id])
    @person = Person.find(params[:person_id])
    @contact.update(contact_params.merge(person: @person))
    redirect_to person_contact_path(@contact.person, @contact)
  end

  # destroy
  def destroy
    @person = Person.find(params[:person_id])
    @contact = @person.contacts.find(params[:id])
    @contact.destroy
    redirect_to person_path(@person)
  end

  private
  def contact_params
    params.require(:contact).permit(:last_name, :first_name, :age, :ethnicity, :origin, :gender, :occupation, :company, :year_met, :place_met, :last_in_contact, :network_size, :email)
  end
end

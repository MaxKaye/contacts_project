class ContactsController < ApplicationController
  # index
  def index
    @contacts = Contact.all
    @contact = Contact.find(params[:person_id])
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
    @contact = Contact.find(params[:id])
  end

  # edit
  def edit
    @contact = Contact.find(params[:id])
  end

  # update
  def update
    @contact = Contact.find(params[:id])
    @person = Person.find(params[:contact_id])
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
    params.require(:contact).permit(:first_name, :last_name, :age, :ethnicity, :origin, :gender, :occupation, :company, :email)
  end
end

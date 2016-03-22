class ContactsController < ApplicationController
  # index
  def index
    @contacts = Contact.all
  end

  # new
  def new
    @person = Person.find(params[:person_id])
    @contact = Contact.new
  end

  # create
  def create
    @person = Person.find(params[:contact_id])
    @contact = Contact.create!(contact_params.merge(person: @person))
    redirect_to contact_contact_path(@person, @contact)
  end

  #show
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
    @contact = Contact.find(params[:id])
    @contact.destroy
    redirect_to contacts_path
  end

  private
  def contact_params
    params.require(:person).permit(:first_name, :last_name, :age, :ethnicity, :origin, :gender, :occupation, :company, :email)
  end
end

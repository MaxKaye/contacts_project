class PeopleController < ApplicationController
  def index

    @email_domain = params[:email_domain] || 'All'

    # get all people
    @people = Person.all
    # get all the available domain names
    # @email_domains = @people.map { |p| p.email.split('@').last }.uniq.sort
    @email_domains = []
    # filter the people based on domain name, when provided
    @people.to_a.select! { |p| p.email.index @email_domain } unless @email_domain == 'All'
  end

  def new
    @person = Person.new
  end

  def create
    #  render plain: params[:person].inspect
    @person = Person.new(person_params)
    @person.save
    redirect_to @person
  end

  def show
     @person = Person.find(params[:id])
    #  redirect_to @person
  end

  def edit
      @person = Person.find(params[:id])
    end

    def update
      @person = Person.find(params[:id])
      @person.update(person_params)
      redirect_to person_path(@person)
    end

    def destroy
        @person = Person.find(params[:id])
        @person.destroy
        redirect_to people_path
      end

  private
  def person_params
    params.require(:person).permit(:first_name, :last_name, :age, :ethnicity, :origin, :gender, :occupation, :company, :email)
  end
end

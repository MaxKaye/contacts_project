class Person < ActiveRecord::Base
  has_many :contacts

  def name
    "#{first_name} #{last_name}"
  end
end

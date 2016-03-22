class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.belongs_to :person
      t.string :first_name
      t.string :last_name
      t.string :age
      t.string :ethnicity
      t.string :origin
      t.string :gender
      t.string :occupation
      t.string :company
      t.string :email
    end
  end
end

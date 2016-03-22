class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
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

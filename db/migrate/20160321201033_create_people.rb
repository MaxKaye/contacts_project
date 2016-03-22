class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :email
      t.text :text
    end
  end
end

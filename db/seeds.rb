require 'csv'

Person.delete_all

CSV.foreach('db/us-500.csv', headers: true) do |row|
  Person.create(
    {
      first_name: row['first_name'],
      last_name: row['last_name'],
      age: row['age'],
      ethnicity: row['ethnicity'],
      origin: row['place_of_birth'],
      gender: row['gender'],
      occupation: row['occupation'],
      company: row['company'],
      email: row['email']
    }
  )
end

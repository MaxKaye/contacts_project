require 'csv'

Person.destroy_all
Contact.destroy_all

marco = Person.create!(first_name: "Marco", last_name: "Polo", age: "746", ethnicity: "Venetian", origin: "Italy", gender: "male", occupation: "Merchant traveler", company: "self employed", email: "m.polo.church.com")
max = Person.create!(first_name: "Max", last_name: "Kaye", age: "23", ethnicity: "Russian", origin: "South Florida", gender: "male", occupation: "Student", company: "GA", email: "maximillianchina@gmail.com")
marco.contacts.create!(last_name: "Columbus", first_name: "Christopher", age: "567", ethnicity: "Portuguese", origin: "Genoa", gender: "male", occupation: "Ship captain / Land Acquirer", company: "Catholic Monarch of Spain", year_met: "1543", place_met: "Fountain of Youth", last_in_contact: "2 years", network_size: "Large")

CSV.foreach('db/contact_data.csv', headers: true) do |row|
  max.contacts.create!(
    {
      first_name: row.fetch('First Name'),
      last_name: row.fetch('Last Name'),
      age: row.fetch('Age'),
      ethnicity: row.fetch('Ethnicity'),
      origin: row.fetch('Origin'),
      gender: row.fetch('Gender'),
      occupation: row.fetch('Occupation'),
      company: row.fetch('Company'),
      year_met: row.fetch('Year Met'),
      place_met: row.fetch('Place Met'),
      last_in_contact: row.fetch('Last in Contact'),
      network_size: row.fetch('Network Size (L/S)'),
      email: row.fetch('Email')
    }
  )
end

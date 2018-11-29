require 'csv'

puts "Destroy all"
Convocation.destroy_all
Match.destroy_all
Registration.destroy_all
Tournament.destroy_all
User.destroy_all

puts "Creating a supervisor"
supervisor = User.create(
   email: "yann@gmail.com",
   password: "azerty",
   password_confirmation: "azerty",
   supervisor: true,
   last_name: "Grégoire",
   first_name: "Yann",
   club: "le Haillan",
   licence: "9344054 E",
   gender: "men",
   ranking: "15/2",
   phone_number: "0607080900"
)


puts "Creating Tournaments"


tournoi1 = Tournament.create(
  supervisor: supervisor,
  name: "Tournoi Adulte ASH",
  city: "Le Haillan",
  courts_number: 7,
  begin_at: "20/11/2018",
  end_at: "05/12/2018",
  photo_url: "Tournoi1.jpg"
  )

tournoi2 = Tournament.create(
  supervisor: supervisor,
  name: "Tournoi Senior",
  city: "Le Bouscat",
  courts_number: 8,
  begin_at: "06/12/2018",
  end_at: "20/06/2018",
  photo_url: "Tournoi2.jpg"
  )

tournoi3 = Tournament.create(
  supervisor: supervisor,
  name: "Tournoi jeunes",
  city: "Avensan",
  courts_number: 4,
  begin_at: "10/03/2019",
  end_at: "25/03/2019",
  photo_url: "Tournoi5.jpg"
  )
tournoi4 = Tournament.create(
  supervisor: supervisor,
  name: "Tournoi des légendes",
  city: "Bordeaux",
  courts_number: 12,
  begin_at: "10/09/2018",
  end_at: "30/09/2018",
  photo_url: "Tournoi4.jpg"
  )

puts "Creating the player"
gauthier = User.create(
 email: "gauthier@gmail.com",
 password: "azerty",
 password_confirmation: "azerty",
 supervisor: false,
 last_name: "Valin",
 first_name: "Gauthier",
 club: "Bordeaux TC",
 licence: "9876543 Z",
 gender: "men",
 ranking: "30/3",
 phone_number: "0698765432"
)
puts "Creating player's inscription"
inscription1 = Registration.create(
  user: gauthier,
  tournament: tournoi1,
  category: "Senior"
)

inscription2 = Registration.create(
  user: gauthier,
  tournament: tournoi1,
  category: "35"
)

inscription3 = Registration.create(
  user: gauthier,
  tournament: tournoi4,
  category: "35"
)

match = Match.create(
    tournament: tournoi1,
    begin_at: "27/11/2019 18:00"
    )

Convocation.create(
  registration: inscription1,
  match: match,
  status: 'accepted'
  )

puts "Implementing Tournoi ASH"

csv_options = { col_sep: ',', quote_char: '"', headers: :first_row }
filepath    = './db/Joueurs.csv'
CSV.foreach(filepath, csv_options) do |row|
  gender = "women"
  gender = "men" if row['Sexe'] == "H"

  player = User.create(
   email: row['eMail'],
   password: "azerty",
   password_confirmation: "azerty",
   supervisor: false,
   last_name: row['Nom'].capitalize,
   first_name: row['Prénom'].capitalize,
   club: row['Club'].capitalize,
   licence: row['Licence'],
   gender: gender,
   phone_number: row['Tél. Mob.'],
   ranking: row['Classt Simple']
  )
  inscription = Registration.create(
    user: player,
    tournament: tournoi1,
    category: row['Cat. Epr.'],
    )
  print "-"
end
puts ""

5.times do
  match = Match.create(
    tournament: tournoi1,
    begin_at: "28/11/2018 15:00"
    )

  Convocation.create(
  registration: Registration.all.sample,
  match: match,
  status: 'pending'
  )
  Convocation.create(
    registration: Registration.all.sample,
    match: match,
    status: 'pending'
  )
end

5.times do
  match = Match.create(
    tournament: tournoi1,
    begin_at: "28/11/2018 18:00"
    )

  Convocation.create(
  registration: Registration.all.sample,
  match: match,
  status: 'pending'
  )
  Convocation.create(
    registration: Registration.all.sample,
    match: match,
    status: 'pending'
  )
end

5.times do
  match = Match.create(
    tournament: tournoi1,
    begin_at: "28/11/2018 20:00"
    )

  Convocation.create(
  registration: Registration.all.sample,
  match: match,
  status: 'pending'
  )
  Convocation.create(
    registration: Registration.all.sample,
    match: match,
    status: 'pending'
  )
end
puts "Seeds done!"
puts "-"*20

require 'csv'

puts "Destroy all"
Convocation.destroy_all
Match.destroy_all
Registration.destroy_all
Tournament.destroy_all
User.destroy_all

puts "Creating a supervisor"
supervisor = User.create(
   email: "supervisor@gmail.com",
   password: "azerty",
   password_confirmation: "azerty",
   supervisor: true,
   last_name: "Yann",
   first_name: "Grégoire@",
   club: "le Haillan",
   licence: "1234567 A",
   gender: "men",
   ranking: "NC",
   phone_number: "0607080900"
)

puts "Creating Tournaments"
tournoi1 = Tournament.create(
  supervisor: supervisor,
  name: "Tournoi Play In Challenger",
  city: "Lille",
  courts_number: 8,
  begin_at: "10/05/2018",
  end_at: "25/05/2018"
  )

tournoi2 = Tournament.create(
  supervisor: supervisor,
  name: "Tournoi BNP Paribas Primerose",
  city: "Bordeaux",
  courts_number: 8,
  begin_at: "20/010/2018",
  end_at: "07/11/2018"
  )


puts "Creating the player"
durand = User.create(
 email: "player@gmail.com",
 password: "azerty",
 password_confirmation: "azerty",
 supervisor: false,
 last_name: "Durand",
 first_name: "Jacques",
 club: "Bordeaux TC",
 licence: "9876543 Z",
 gender: "men",
 ranking: "30/3",
 phone_number: "0698765432"
)

inscription1 = Registration.create(
  user: durand,
  tournament: tournoi2,
  category: "Senior"
)

inscription2 = Registration.create(
  user: durand,
  tournament: tournoi2,
  category: "35"
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
   last_name: row['Gautier'],
   first_name: row['Valin'],
   club: row['Club'],
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

15.times do
  match = Match.create(
    tournament: tournoi1,
    begin_at: "15/05/2019 15:00"
    )

  Convocation.create(
  registration: inscription1,
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

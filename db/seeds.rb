require 'csv'

puts "Destroy all"
Convocation.destroy_all
Match.destroy_all
Registration.destroy_all
Tournament.destroy_all
User.destroy_all

puts "creating a supervisor"
supervisor = User.create(
   email: "supervisor@gmail.com",
   password: "azerty",
   password_confirmation: "azerty",
   supervisor: true,
   last_name: "Dupont",
   first_name: "Michel",
   club: "le Haillan",
   licence: "1234567 A",
   gender: "men",
   ranking: "NC",
   phone_number: "0607080900"
)

puts "Creating Tournaments"
tournoi1 = Tournament.create(
  supervisor: supervisor,
  name: "Tournoi Adulte ASH",
  city: "Le Haillan",
  courts_number: 4,
  begin_at: "10/05/2019",
  end_at: "30/05/2019"
  )

tournoi2 = Tournament.create(
  supervisor: supervisor,
  name: "Tournoi Senior",
  city: "Le Bouscat",
  courts_number: 8,
  begin_at: "10/05/2019",
  end_at: "30/05/2019"
  )

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
  tournament: tournoi1,
  category: "Senior"
)

inscription2 = Registration.create(
  user: durand,
  tournament: tournoi2,
  category: "Senior"
)

match = Match.create(
  tournament: tournoi1,
  begin_at: "15/05/2019 15:00")
Convocation.create(
  user: durand,
  match: match,
  status: 'pending'
)
Convocation.create(
  user: User.where("supervisor=false").sample,
  match: match,
  status: 'pending'
)

puts "Creating Players"

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
   last_name: row['Nom'],
   first_name: row['Prénom'],
   club: row['Club'],
   licence: row['Licence'],
   gender: gender,
   ranking: row['Classt Simple'],
   phone_number: row['Tél. Mob.']
  )
  inscription = Registration.create(
    user: player,
    tournament: tournoi1,
    category: row['Cat. Epr.']
    )
  print "-"
end
puts ""

puts "Creating matches"
5.times do
  match = Match.create(
    tournament: tournoi1,
    begin_at: "15/05/2019 15:00")
  Convocation.create(
    user: User.where("supervisor=false").sample,
    match: match
  )
  Convocation.create(
    user: User.where("supervisor=false").sample,
    match: match
  )
end
puts "Seeds done!"
puts "-"*20

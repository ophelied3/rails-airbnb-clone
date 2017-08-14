# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Horse.destroy_all
User.destroy_all

puts "Début du Seed"
puts "Génération d'un user"
user1 = User.new(last_name: "Yeah", first_name:"Nay", email:"yeahornay@yeahornay.com", birth_date: Date.new(2004,4,12), sexe: "Homme", level: 5, password: "coucou", photo_url: "https://www.fillmurray.com/300/300")
user1.save!
puts "Fin de génération d'user"

name = ["Petit tonnerre", "Tatayoyo", "Poilu de france", "Miaou", "Litchi", "Auzac", "Nuit torride", "Sacrée soirée" ]
address = ["91, rue Gouin de Beauchesne 44600 SAINT-NAZAIRE", "23 avenue georges pompidou, 75008 Paris", "72 avenue mottet, 06250 Cannes", "21 rue fernand Marin, 33000 Bordeaux", "14 avenue georges mondel, 75016 Paris", "43 avenue de la rotonde, 59000 Lille", "83 rue surson, 33300 Bordeaux", "122 allée de la capitainerie, 77220 Montereau"]
description = ["Propose 1/2 pension sur Lobell Sport, TF de 17 ans dans petite écurie de propriétaires à Drocourt (78) 10mn de Mantes la Jolie et 10 mn de Magny-en-Vexin.", "Propose demi-pension sur jolie et gentille jument hollandaise de dressage de 11 ans dans écurie de propriétaire avec encadrement exceptionnel et cours inclus.
Pour cavalier galop 7 minimum.", "Twist est un très gentil cheval de 1M67 plein papiers de 10 ans un très gros potentiel.", "Cheval agréable autant sur le plat qu’a l’obstacle.", "Polyvalent (dressage, ballade, trotting, saut cso)", "Propose demi-pension sur un jeune cheval de sport au coeur énorme, Selle français, pour 3 fois par semaine avec cours possible. Pratique du dressage, et balade.", "Cheval au pré depuis plus d’un an. Quelques balades, montes et longes mais pas de réel travail suivi pendant cette période. Je cherche quelqu’un qui aura la patience de le remettre au travail en commençant par des longes.", "Un bon galop 5 est attendu car jument délicate et qui joue de son cavalier si trop ‘soft’ mais aucun vice. Aucune chute en 3 ans, Tess est une jument appliquée, respectueuse en selle et pas vicieuse. Un peu chaude en longe mais se gère bien."]
title = ["Demi-pension sur selle français", "Demi-pension loisirs sur ponette", "Propose Trotteur en demi-pension", "Quart de pension surhongre", "Demi-pension sur cheval de compétion","Tiers de pension randonnée","Demi-pension cheval tres calin", "Cherche demi-pension competition"]
birth_date = [Date.new(1996,7,3), Date.new(1998,8,2), Date.new(2004,4,12), Date.new(1994,9,21), Date.new(2012,4,26), Date.new(2014,7,24),Date.new(2013,1,1),Date.new(2004,2,12)]
sexe = ["Hongre","Etalon","Jument"]
race =["Trotteur Français", "Selle français", "Pur-sang arabe", "Anglo-Arabe", "Cheval de Sport", "Anglo-Normand", "Camargue", "Mérens", "Lusitanien", "Quarter Horse", "Paint Horse", "Barbe", "Appaloosa", "Islandais", "Lipizzan", "Shagya", "Henson", "Crème", "Castillonnais", "Trakehner", "Frison", "Akhal-Teke", "AQPS", "Cheval Corse", "Cheval de race Auvergne", "Poney français de selle", "Shetland", "Pottok", "Connemara", "Welsh", "Haflinger", "Fjord", "New Forest", "Landais", "Dartmoor", "Highland", "Comtois", "Breton", "Percheron", "Ardennais", "Cob normand", "Boulonnais", "Auxois", "Poitevin", "Trait du nord", "Franches Montagnes", "Baudet du Poitou", "Ane du Cotentin", "Ane de provence", "Ane des Pyrénées", "Ane normand", "Ane grand noir du Berry", "Ane Boubonnais"]
disciplines = ["CCE", "CSO", "Dressage", "Endurance", "Endurance en attelage", "Equifeel", "Equifun", "Horse-ball",  "Hunter", "Paddock Polo", "Paraéquestre", "Poneys", "Pony-Games", "TREC", "TREC en attelage", "Travail à pied", "Voltige", "Western", "Courses de galop à poney", "Trot à poney", "Amazone", "Cheval de chasse", "Doma vaquera", "Equitation Camargue", "Equitation de travail", "Equitation islandaise", "Equitation portugaise", "Ski-jöering", "Tir à l'arc à cheval"]
character = ["Vif", "Calme", "Joueur", "Sûr"]
photos_url = ["https://images.pexels.com/photos/257573/pexels-photo-257573.jpeg?w=1260&h=750&auto=compress&cs=tinysrgb", "https://images.pexels.com/photos/209065/pexels-photo-209065.jpeg?w=1260&h=750&auto=compress&cs=tinysrgb","https://static.pexels.com/photos/161461/horse-brown-mold-thoroughbred-arabian-foal-161461.jpeg?w=1260&h=750&auto=compress&cs=tinysrgb", "https://images.pexels.com/photos/236651/pexels-photo-236651.jpeg?w=1260&h=750&auto=compress&cs=tinysrgb", "https://images.pexels.com/photos/236651/pexels-photo-236651.jpeg?w=1260&h=750&auto=compress&cs=tinysrgb", "https://images.pexels.com/photos/297201/pexels-photo-297201.jpeg?w=1260&h=750&auto=compress&cs=tinysrgb", "https://images.pexels.com/photos/370179/pexels-photo-370179.jpeg?w=1260&h=750&auto=compress&cs=tinysrgb", "https://images.pexels.com/photos/463735/pexels-photo-463735.jpeg?w=1260&h=750&auto=compress&cs=tinysrgb" ]


puts "Génération des chevaux"
for i in (0..7) do
  Horse.new(name:name[i], address: address[i], description: description[i], title: title[i], birth_date: birth_date[i], sexe: sexe.sample, race: race.sample, disciplines: disciplines.sample, character: character.sample, required_level: rand(0..9), monthly_price: rand(50..300), user_id: user1.id, photos_url: photos_url[i]).save!
  puts "Cheval #{i+1} créé"
end
puts "Fin du Seed"

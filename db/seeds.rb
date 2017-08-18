# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts 'Suppression des entrée précédente...'
puts 'Suppression des bookings'
Booking.destroy_all
puts 'Suppression des Horses'
Horse.destroy_all
puts 'Suppression des Users'
User.destroy_all
puts 'Done.'

puts 'Début du Seed...'
first_name = ['Jerome', 'Ophélie', 'Jules', 'Arnaud']
last_name = ['Vivier', 'Delrieu', 'Maregiano', 'APRAHAMIAN']
email = ['jerome.vivier@edhec.com','ophelie.delrieu3@orange.fr', 'jules.maregiano@gmail.com', 'arnaud.aprahamian@gmail.com']
birth_date = [Date.new(1992,1,31), Date.new(1996,7,3), Date.new(1988,7,26), Date.new(1995,5,7)]
usersexe = ['Homme', 'Femme', 'Homme', 'Homme']
level = [4,9,7,1]
photo_url = ['https://scontent-cdg2-1.xx.fbcdn.net/v/t1.0-9/11709247_10206311692807977_6592313504708086650_n.jpg?oh=2999ffd774b07fd32e14cbd751e96913&oe=5A356408', 'https://scontent-cdg2-1.xx.fbcdn.net/v/t31.0-1/c348.0.960.960/p960x960/14542538_10207929828985442_1702045537103892698_o.jpg?oh=ab794795797586cd1a3261fc7ccdfc70&oe=5A323BF0', 'https://scontent-cdg2-1.xx.fbcdn.net/v/t1.0-9/11026142_10153369592714788_3993364344459696435_n.jpg?oh=47564b9b9f6b5b1f05670c19bc2f8e88&oe=59EFE3D4', 'https://scontent-cdg2-1.xx.fbcdn.net/v/t1.0-9/20841823_1488940124502033_1504670497674323338_n.jpg?oh=50044d80a2eb734c7820d5ac84d44f21&oe=5A32C238']


puts 'Génération des users...'
user1 = User.new(last_name: 'Yeah', first_name:'Nay', email:'yeahornay@yeahornay.com', birth_date: Date.new(2004,4,12), sexe: 'Homme', level: 5, password: 'coucou', photo_url: 'https://www.fillmurray.com/300/300')
user1.save!
puts 'User 1 creé'
for i in (0..3) do
  User.new(last_name: last_name[i], first_name: first_name[i], email: email[i], birth_date: birth_date[i], sexe: usersexe[i], level: level[i], password: 'coucou', photo_url: photo_url[i]).save!
  puts "User #{i + 2} créé"
end
puts 'Done.'

puts "Creation de l'index des IDs de l'user..."
  users = User.all
  users_id = []
  users.each do |user|
    users_id << user.id
  end
puts 'Done.'

name = ['Petit tonnerre', 'Tatayoyo', 'Poilu de france', 'Miaou', 'Litchi', 'Auzac', 'Nuit torride', 'Sacrée soirée' ]
address = ['107 Cours Balguerie Stuttenberg, 33300 Bordeaux', '511 Avenue de la Plage, 40600 Biscarrosse', '2 Rue des Sports, 69200 Vénissieux', 'Avenue du Polygone, 75012 Paris', '17 Avenue de Limoges, 87920 Condat-sur-Vienne', '37 Chemin des Canalets, 31400 Toulouse', '33 Traverse de Carthage, 13008 Marseille', '3 Rond-Point des Acacias, 59790 Ronchin']
description = ['Propose 1/2 pension sur Lobell Sport, TF de 17 ans dans petite écurie de propriétaires à Drocourt (78) 10mn de Mantes la Jolie et 10 mn de Magny-en-Vexin.', 'Propose demi-pension sur jolie et gentille jument hollandaise de dressage de 11 ans dans écurie de propriétaire avec encadrement exceptionnel et cours inclus.
Pour cavalier galop 7 minimum.', 'Twist est un très gentil cheval de 1M67 plein papiers de 10 ans un très gros potentiel.', "Cheval agréable autant sur le plat qu’a l’obstacle.", 'Polyvalent (dressage, ballade, trotting, saut cso)', 'Propose demi-pension sur un jeune cheval de sport au coeur énorme, Selle français, pour 3 fois par semaine avec cours possible. Pratique du dressage, et balade.', 'Cheval au pré depuis plus d’un an. Quelques balades, montes et longes mais pas de réel travail suivi pendant cette période. Je cherche quelqu’un qui aura la patience de le remettre au travail en commençant par des longes.', "Un bon galop 5 est attendu car jument délicate et qui joue de son cavalier si trop ‘soft’ mais aucun vice. Aucune chute en 3 ans, Tess est une jument appliquée, respectueuse en selle et pas vicieuse. Un peu chaude en longe mais se gère bien."]
title = ['Demi-pension sur selle français', 'Demi-pension loisirs sur ponette', 'Propose Trotteur en demi-pension', 'Quart de pension surhongre', 'Demi-pension sur cheval de compétion','Tiers de pension randonnée','Demi-pension cheval tres calin', 'Cherche demi-pension competition']
birth_date = [Date.new(1996,7,3), Date.new(1998,8,2), Date.new(2004,4,12), Date.new(1994,9,21), Date.new(2012,4,26), Date.new(2014,7,24),Date.new(2013,1,1),Date.new(2004,2,12)]
sexe = ['Hongre','Etalon','Jument']
race = ['Trotteur Français', 'Selle français', 'Pur-sang arabe', 'Anglo-Arabe', 'Cheval de Sport', 'Anglo-Normand', 'Camargue', 'Mérens', 'Lusitanien', 'Quarter Horse', 'Paint Horse', 'Barbe', 'Appaloosa', 'Islandais', 'Lipizzan', 'Shagya', 'Henson', 'Crème', 'Castillonnais', 'Trakehner', 'Frison', 'Akhal-Teke', 'AQPS', 'Cheval Corse', 'Cheval de race Auvergne', 'Poney français de selle', 'Shetland', 'Pottok', 'Connemara', 'Welsh', 'Haflinger', 'Fjord', 'New Forest', 'Landais', 'Dartmoor', 'Highland', 'Comtois', 'Breton', 'Percheron', 'Ardennais', 'Cob normand', 'Boulonnais', 'Auxois', 'Poitevin', 'Trait du nord', 'Franches Montagnes', 'Baudet du Poitou', 'Ane du Cotentin', 'Ane de provence', 'Ane des Pyrénées', 'Ane normand', 'Ane grand noir du Berry', 'Ane Boubonnais']
disciplines = ['CCE', 'CSO', 'Dressage', 'Endurance', 'Endurance en attelage', 'Equifeel', 'Equifun', 'Horse-ball',  'Hunter', 'Paddock Polo', 'Paraéquestre', 'Poneys', 'Pony-Games', 'TREC', 'TREC en attelage', 'Travail à pied', 'Voltige', 'Western', 'Courses de galop à poney', 'Trot à poney', 'Amazone', 'Cheval de chasse', 'Doma vaquera', 'Equitation Camargue', 'Equitation de travail', 'Equitation islandaise', 'Equitation portugaise', 'Ski-jöering', "Tir à l'arc à cheval"]
character = ['Vif', 'Calme', 'Joueur', 'Sûr', 'Charismatique', 'Compétitif', 'Éduqué', 'Énergique', 'Tranquille']
horse_pic_url = ['https://images.pexels.com/photos/257573/pexels-photo-257573.jpeg?w=1260&h=750&auto=compress&cs=tinysrgb', 'https://images.pexels.com/photos/209065/pexels-photo-209065.jpeg?w=1260&h=750&auto=compress&cs=tinysrgb','https://static.pexels.com/photos/161461/horse-brown-mold-thoroughbred-arabian-foal-161461.jpeg?w=1260&h=750&auto=compress&cs=tinysrgb', 'https://images.pexels.com/photos/236651/pexels-photo-236651.jpeg?w=1260&h=750&auto=compress&cs=tinysrgb', 'https://images.pexels.com/photos/236651/pexels-photo-236651.jpeg?w=1260&h=750&auto=compress&cs=tinysrgb', 'https://images.pexels.com/photos/297201/pexels-photo-297201.jpeg?w=1260&h=750&auto=compress&cs=tinysrgb', 'https://images.pexels.com/photos/370179/pexels-photo-370179.jpeg?w=1260&h=750&auto=compress&cs=tinysrgb', 'https://images.pexels.com/photos/463735/pexels-photo-463735.jpeg?w=1260&h=750&auto=compress&cs=tinysrgb']


puts 'Génération des chevaux'
for i in (0..7) do
  Horse.new(name:name[i], address: address[i], description: description[i], title: title[i], birth_date: birth_date[i], sexe: sexe.sample, race: race.sample, disciplines: disciplines.sample, character: character.sample, required_level: rand(0..9), monthly_price: rand(50..300), user_id: user1.id, horse_pic_url: horse_pic_url[i]).save!
  puts "Cheval #{i+1} créé"
end

horse_pic_url2 = ['https://images.pexels.com/photos/235894/pexels-photo-235894.jpeg?h=350&auto=compress&cs=tinysrgb', 'https://images.pexels.com/photos/103543/pexels-photo-103543.jpeg?h=350&auto=compress&cs=tinysrgb', 'https://images.pexels.com/photos/451811/pexels-photo-451811.jpeg?h=350&auto=compress&cs=tinysrgb', 'https://images.pexels.com/photos/158976/pexels-photo-158976.jpeg?h=350&auto=compress&cs=tinysrgb', 'https://images.pexels.com/photos/220039/pexels-photo-220039.jpeg?h=350&auto=compress&cs=tinysrgb', 'https://images.pexels.com/photos/194532/pexels-photo-194532.jpeg?h=350&auto=compress&cs=tinysrgb', 'https://images.pexels.com/photos/85673/horse-head-animal-portrait-countryside-85673.jpeg?h=350&auto=compress&cs=tinysrgb', 'https://images.pexels.com/photos/2971/farm-animals-horses.jpg?h=350&auto=compress&cs=tinysrgb', 'https://images.pexels.com/photos/463735/pexels-photo-463735.jpeg?h=350&auto=compress&cs=tinysrgb', 'https://images.pexels.com/photos/533109/pexels-photo-533109.jpeg?h=350&auto=compress&cs=tinysrgb', 'https://images.pexels.com/photos/159889/pexels-photo-159889.jpeg?h=350&auto=compress&cs=tinysrgb', 'https://images.pexels.com/photos/37991/pexels-photo-37991.jpeg?h=350&auto=compress&cs=tinysrgb', 'https://images.pexels.com/photos/33096/horse-animal-ride-reiterhof.jpg?h=350&auto=compress&cs=tinysrgb', 'https://images.pexels.com/photos/316904/pexels-photo-316904.jpeg?h=350&auto=compress&cs=tinysrgb', 'https://images.pexels.com/photos/33262/horse-animal-ride-reiterhof.jpg?h=350&auto=compress&cs=tinysrgb', 'https://images.pexels.com/photos/248292/pexels-photo-248292.jpeg?h=350&auto=compress&cs=tinysrgb', 'https://images.pexels.com/photos/129187/pexels-photo-129187.jpeg?h=350&auto=compress&cs=tinysrgb', 'https://images.pexels.com/photos/133019/pexels-photo-133019.jpeg?h=350&auto=compress&cs=tinysrgb']
name2 = ['Black Caviar', 'Coup de Folie', 'Prince Rose', 'Sunday Silence', 'Dancing Brave', 'Northern Dancer', 'Cirrus des Aigles', 'Eclipse', 'Seattle Slew', 'Seabiscuit', 'Dahlia', 'Rock of Gibraltar', 'Nuit blanche', 'Douceur', 'Ouragan', 'Auriac', 'Mélodie', 'Grandiose', 'Petit nuage', 'Apache', 'Spirit', 'Jappeloup']
address2 = ['155 Avenue du Port du Roy, 33290 Blanquefort', "Chemin de Leysotte, 33140 Villenave-d'Ornon", '64 Rue Magendie, 33000 Bordeaux', '10 Route de la Seillonne, 31130 Pin-Balma', '12 Route de la Seillonne, 31130 Pin-Balma', '56 Rue des Renaudes, 75017 Paris', '1 Rue Godefroy Cavaignac, 75011 Paris', 'Château Belfort, Allée de la Pargaud, 33160 Saint-Médard-en-Jalles', '545 Givry, 71870 Laizé', 'Route de Brezolles, 78540 Vernouillet', "75 Cours d'Albret, 33000 Bordeaux", '36 Rue Élie Gintrac, 33000 Bordeaux', '83 rue de surson, 33300 Bordeaux', '13 Rue des Bahutiers, 33000 Bordeaux', '127 Avenue Thiers, 33100 Bordeaux', '2 Rue Courbin, 33000 Bordeaux', '82 Avenue des Primevères, 93370 Montfermeil', 'Chemin de la Plaine, 95130 Le Plessis-Bouchard', '5 Rue des Hauts Guibouts, 94360 Bry-sur-Marne', ' Route du Château de Saint-Thibault, 77230 Montgé-en-Goële', ' 55 Ruelle du Moulin de Martigny, 77860 Couilly-Pont-aux-Dames', ' 251 Avenue de la Victoire, 77100 Meaux']
title2 = ['DP sur pur race espagnole', 'DP jument New Forest au top!', 'DP poney polyvalent', 'Recherche demi pension (74)', 'Demi pension sur un hongre']
description2 = ["Un galop 6-7 conviendrait car c'est un cheval qui demande de la finesse ,une main légère et de l'équilibre. Une selle de dressage et un filet ainsi que les tapis sont fournis contre bons soins.", "Elle travaille très bien, elle a de très belles bases en dressage, toujours très appliquée, et beaucoup de technique à l'obstacle.", "Oscar recherche une DP, c'est un super petit poney avec un coeur énorme ! Il touche à toutes les disciplines : il a de très bonnes bases en dressage, un coup de saut au top, et il passe partout en balade !', 'Cheval très bien dressé et adorable. Discipline dressage cso et cce. Idéale club 1 et amateur 4 pour concours.', 'Je mets mon cheval en demi-pension. Il est agréable à monté et trés gentil pour son âge."]

for i in (0..21) do
  Horse.new(name:name2[i], address: address2[i], description: description2.sample, title: title2.sample, birth_date: birth_date.sample, sexe: sexe.sample, race: race.sample, disciplines: disciplines.sample, character: character.sample, required_level: rand(0..9), monthly_price: rand(50..300), user_id: users_id.sample, horse_pic_url: horse_pic_url2.sample).save!
  puts "Cheval #{i+9} créé"
end


puts 'Done.'
puts 'Fin du Seed'

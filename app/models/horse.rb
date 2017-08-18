class Horse < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_many :discplines

  RACES = [
    'Trotteur Français', 'Selle français', 'Pur-sang arabe', 'Anglo-Arabe', 'Cheval de Sport', 'Anglo-Normand', 'Camargue', 'Mérens', 'Lusitanien', 'Quarter Horse', 'Paint Horse', 'Barbe', 'Appaloosa', 'Islandais', 'Lipizzan', 'Shagya', 'Henson', 'Crème', 'Castillonnais',
     'Trakehner', 'Frison', 'Akhal-Teke', 'AQPS', 'Cheval Corse', 'Cheval de race Auvergne', 'Poney français de selle', 'Shetland', 'Pottok', 'Connemara', 'Welsh', 'Haflinger', 'Fjord', 'New Forest', 'Landais', 'Dartmoor', 'Highland', 'Comtois', 'Breton', 'Percheron',
     'Ardennais','Cob normand', 'Boulonnais', 'Auxois', 'Poitevin', 'Trait du nord', 'Franches Montagnes', 'Baudet du Poitou', 'Ane du Cotentin', 'Ane de provence', 'Ane des Pyrénées', 'Ane normand', 'Ane grand noir du Berry', 'Ane Boubonnais'
   ].freeze

  DISCIPLINES = ['CCE', 'CSO', 'Dressage', 'Endurance', 'Endurance en attelage', 'Equifeel', 'Equifun', 'Horse-ball',  'Hunter', 'Paddock Polo', 'Paraéquestre', 'Poneys', 'Pony-Games', 'TREC', 'TREC en attelage', 'Travail à pied', 'Voltige', 'Western', 'Courses de galop à poney',
     'Trot à poney', 'Amazone', 'Cheval de chasse', 'Doma vaquera', 'Equitation Camargue', 'Equitation de travail', 'Equitation islandaise', 'Equitation portugaise', 'Ski-jöering',
     "Tir à l'arc à cheval"].freeze

  CHARACTERS = %w[Vif Calme Joueur Sûr Charismatique Compétitif Éduqué Énergique Tranquille]

  validates :name, :address, :title, :birth_date, presence: true
  validates :sexe, inclusion: { in: %w[Etalon Hongre Jument] }
  validates :race, inclusion: { in: RACES }
  validates :disciplines, inclusion: { in: DISCIPLINES }
  validates :character, inclusion: { in: CHARACTERS }
  validates :required_level, numericality: { only_integer: true }
  validates :monthly_price, numericality: { only_integer: true }
  has_attachment :horse_pic
  has_attachments :photos, maximum: 5
  validates :horse_pic, presence: true
  geocoded_by :address
  after_validation :geocode, if: :address_changed?

  def self.races
    RACES
  end

  def self.disciplines
    DISCIPLINES
  end

  def self.characters
    CHARACTERS
  end

  def self.search(params)
    horses = Horse.page
    begin_date = Date.new(params['begin_date(1i)'].to_i, params['begin_date(2i)'].to_i, params['begin_date(3i)'].to_i)
    final_date = Date.new(params['final_date(1i)'].to_i, params['final_date(2i)'].to_i, params['final_date(3i)'].to_i)

    horses = horses.where(race: params[:race]) if params[:race].present?
    horses = horses.near(params[:address], 20) if params[:address].present?

    horses = horses.joins(:bookings).where.not('(start_date BETWEEN ? AND ? OR end_date BETWEEN ? AND ?) OR (start_date <= ? AND end_date >= ?)', begin_date, final_date, begin_date, final_date, begin_date, final_date) + horses.left_outer_joins(:bookings).where(bookings: { id: nil })
    Kaminari.paginate_array(horses).page(params[:page]).per(10)
  end

  def average_rating
    ratings = bookings.map(&:rating).reject(&:nil?)
    ratings.empty? ? 5 : ratings.sum.to_f / ratings.size
  end
end

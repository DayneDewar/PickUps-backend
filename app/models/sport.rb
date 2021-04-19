class Sport < ApplicationRecord
  belongs_to :user
  has_many :events

  def new_sport(user_id)
    @favorite_sport = FavoriteSport.create(user_id: user_id, sport: self)
  end

end

class ViewingParty < ApplicationRecord

  has_many :user_viewing_parties
  has_many :users, through: :user_viewing_parties

  validates_presence_of :movie_title,
                        :duration,
                        :start_date,
                        :start_time,
                        :image
end

# == Schema Information
#
# Table name: artworks
#
#  id         :bigint           not null, primary key
#  title      :string           not null
#  image_url  :string           not null
#  artist_id  :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Artwork < ApplicationRecord
    validates :title, :image_url, :artist_id, presence: true
    validates :image_url, uniqueness: true
    validates :artist_id, uniqueness: {scope: :title}

    belongs_to :artist,
        foreign_key: :artist_id,
        class_name: :User

    has_many :shared_art_piece,
        foreign_key: :artwork_id,
        class_name: :ArtworkShare,
        dependent: :destroy,
        inverse_of: :art_piece

    has_many :artwork_comments,
        foreign_key: :artwork_id,
        class_name: :Comment,
        inverse_of: :parentart,
        dependent: :destroy

    has_many :shared_viewers,
        through: :shared_art_piece,
        source: :viewer,
        dependent: :destroy

end

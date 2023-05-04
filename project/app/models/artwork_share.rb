# == Schema Information
#
# Table name: artwork_shares
#
#  id         :bigint           not null, primary key
#  artwork_id :bigint           not null
#  viewer_id  :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class ArtworkShare < ApplicationRecord
    validates :artwork_id, :viewer_id, presence: true
    validates :artwork_id, uniqueness: {scope: :viewer_id}

    belongs_to :art_piece,
        foreign_key: :artwork_id,
        class_name: :Artwork
        # inverse_of: :viewed_artwork

    belongs_to :viewer,
        foreign_key: :viewer_id,
        class_name: :User
        # inverse_of: :shared_art_piece


end

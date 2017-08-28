# == Schema Information
#
# Table name: tracks
#
#  id         :integer          not null, primary key
#  album_id   :integer          not null
#  title      :string           not null
#  ord        :string           not null
#  lyrics     :text
#  bonus      :boolean          default(FALSE), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Track < ApplicationRecord
  validates :album_id, :title, :ord, presence: true
  validates :title, uniqueness: { scope: :album_id }

  belongs_to :album
end

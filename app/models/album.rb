# == Schema Information
#
# Table name: albums
#
#  id             :integer          not null, primary key
#  name           :string           not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  band_id        :integer          not null
#  recording_type :string
#

class Album < ActiveRecord::Base
  belongs_to :band
  has_many :tracks

  validates :name, :band_id, :recording_type, presence: true
end

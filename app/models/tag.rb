# == Schema Information
#
# Table name: tags
#
#  id            :integer          not null, primary key
#  name          :string
#  taggable_id   :integer
#  taggable_type :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Tag < ApplicationRecord
  validates :name, :taggable_id, :taggable_type, presence: true

  belongs_to :taggable, polymorphic: true
end

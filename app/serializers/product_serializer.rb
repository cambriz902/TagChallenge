# == Schema Information
#
# Table name: products
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class ProductSerializer < ActiveModel::Serializer
  has_many :tags, as: :taggable
end

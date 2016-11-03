# == Schema Information
#
# Table name: articles
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class ArticleSerializer < ActiveModel::Serializer
  has_many :tags, as: :taggable
end

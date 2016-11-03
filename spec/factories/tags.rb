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

FactoryGirl.define do
  factory :tag do
    name 'sport'
  end
end

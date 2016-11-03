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

require 'rails_helper'

RSpec.describe Tag, :type => :model do
  let(:tag) { FactoryGirl.build :tag }
  subject { tag }

  it { should respond_to(:name) }
  it { should respond_to(:taggable_id) }
  it { should respond_to(:taggable_type) }

  it { should validate_presence_of :name }
  it { should validate_presence_of :taggable_id }
  it { should validate_presence_of :taggable_type }

  it { should belong_to :taggable }
end

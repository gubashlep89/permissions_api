# == Schema Information
#
# Table name: roles
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Role < ApplicationRecord
  has_and_belongs_to_many :users
  has_many :permissions, dependent: :destroy
  accepts_nested_attributes_for :permissions
end

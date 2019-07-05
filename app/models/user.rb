# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class User < ApplicationRecord
  has_and_belongs_to_many :roles
  has_many :permissions, dependent: :destroy
  accepts_nested_attributes_for :permissions, allow_destroy: true
end

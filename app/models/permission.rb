# == Schema Information
#
# Table name: permissions
#
#  id              :integer          not null, primary key
#  name            :string
#  permission_type :integer
#  role_id         :integer
#  user_id         :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class Permission < ApplicationRecord
  belongs_to :role, optional: true
  belongs_to :user, optional: true

  enum permission_type: [:read, :write]
end

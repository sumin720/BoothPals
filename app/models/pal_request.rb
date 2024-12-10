# == Schema Information
#
# Table name: pal_requests
#
#  id         :bigint           not null, primary key
#  status     :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  mentee_id  :integer
#  mentor_id  :integer
#
class PalRequest < ApplicationRecord
  belongs_to :mentor, class_name: 'User'
  belongs_to :mentee, class_name: 'User'

  validates :status, presence: true
  validates :status, inclusion: { in: %w[pending accepted declined] }
end


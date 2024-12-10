# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  city                   :string
#  concentration          :string
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  state                  :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Allowed concentrations in a constant
  CONCENTRATIONS = [
    "Accounting",
    "Analytic Finance",
    "Behavioral Science",
    "Business Analytics",
    "Econometrics and Statistics",
    "Economics"
    "Entrepreneurship",
    "Finance",
    "General Management",
    "Healthcare",
    "International Business",
    "Marketing Management",
    "Operations Management",
    "Strategic Management",
          ]
        
  validates :state, presence: true, on: :update
  validates :city, presence: true, on: :update
  validates :concentration, inclusion: { in: CONCENTRATIONS }, allow_blank: true
  end
        
end

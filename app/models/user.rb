# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  city                   :string
#  concentrations         :text             default([]), is an Array
#  confirmation_sent_at   :datetime
#  confirmation_token     :string
#  confirmed_at           :datetime
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  location               :string
#  program_type           :string
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  state                  :string
#  unconfirmed_email      :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_confirmation_token    (confirmation_token) UNIQUE
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#

class User < ApplicationRecord
  # Devise modules: Removed :confirmable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # Validation for email domains
  validate :email_domain_whitelist

  def email_domain_whitelist
    allowed_domains = %w[uchicago.edu chicagobooth.edu]
    if email.present?
      domain = email.split('@').last
      unless allowed_domains.include?(domain)
        errors.add(:email, "must be @uchicago.edu or @chicagobooth.edu. Please use a valid school email.")
      end
    end
  end

  # Program types
  PROGRAM_TYPES = ["Weekend", "Evening", "Full-Time"]

  # Multiple concentrations
  CONCENTRATIONS = [
    "Accounting",
    "Analytic Finance",
    "Behavioral Science",
    "Business Analytics",
    "Econometrics and Statistics",
    "Economics",
    "Entrepreneurship",
    "Finance",
    "General Management",
    "Healthcare",
    "International Business",
    "Marketing Management",
    "Operations Management",
    "Strategic Management"
  ]

  # Validate program_type
  validates :program_type, inclusion: { in: PROGRAM_TYPES }, allow_blank: true

  # Validate concentrations
  validate :validate_concentrations

  def validate_concentrations
    if concentrations.any? { |c| !CONCENTRATIONS.include?(c) }
      errors.add(:concentrations, "contain an invalid selection.")
    end
  end

  # Associations for pal requests
  has_many :pal_requests_as_mentor, class_name: "PalRequest", foreign_key: "mentor_id"
  has_many :mentees, through: :pal_requests_as_mentor, source: :mentee

  has_many :pal_requests_as_mentee, class_name: "PalRequest", foreign_key: "mentee_id"
  has_many :mentors, through: :pal_requests_as_mentee, source: :mentor
end

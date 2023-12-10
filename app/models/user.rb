class User < ApplicationRecord
  has_one :parent
  has_one :teacher

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :first_name, presence: true, length: { in: 1..100 }
  validates :last_name, presence: true, length: { in: 1..100 }
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :user_type, presence: true, acceptance: { accept: [1, 2] }

  def admin?
    role == 'admin'
  end
end

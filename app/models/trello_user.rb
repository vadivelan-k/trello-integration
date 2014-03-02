class TrelloUser < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessible :token, :email
  
  # Validations
  validates :email, presence: true, uniqueness: true
  validates :token, presence: true, uniqueness: true
end

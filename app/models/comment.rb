class Comment < ApplicationRecord
  belongs_to :article
  validates :heading, presence: true
  validates :body, presence: true
end

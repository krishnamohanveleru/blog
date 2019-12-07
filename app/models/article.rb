class Article < ApplicationRecord
	has_many :comments , dependent: :destroy
	scope :article_created_at, -> { where(created_at: Time.now.beginning_of_day..Time.now) }


validates :headline, presence: true

before_save :generate_friendlyid
private 
def generate_friendlyid
	self.friendly_id = self.headline.downcase.gsub(/s\s/,'-')
end	

end

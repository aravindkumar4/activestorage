class Drop < ApplicationRecord
	has_one_attached :file 
	has_one_attached :image
	has_one_attached :clip
	has_one_attached :thumbnail

	validates :title,presence: true
	
	validate :correct_image_type

	private

	def correct_image_type
		if image.attached? && !image.content_type.in?(%w(image/jpeg image/png))
			errors.add(:image, 'must be jpeg or png.')
		elsif image.attached? == false
			errors.add(:image, 'must have an image')
		end
	end

end

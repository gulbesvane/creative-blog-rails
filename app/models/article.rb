class Article < ApplicationRecord
    #validate that a title and description are present before saving an article
    validates :title, presence: true, length: { minimum: 5, maximum: 150}
    validates :description, presence: true, length: { minimum: 8, maximum: 350}

end
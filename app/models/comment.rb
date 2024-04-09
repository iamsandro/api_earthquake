class Comment < ApplicationRecord
  attribute :body, :text
  attribute :feature_id, :string

  validates :body, presence: true
  validates :feature_id, presence: true

  belongs_to :feature

end

class Comment < ApplicationRecord
  attribute :body, :text
  attribute :feature_id, :string

  validates :body, presence: true
  validates :feature_id, presence: {message: "the feature_id is required"} 
  validate :existence

  belongs_to :feature

  private 

  def existence
     errors.add(:feature_id, " #{feature_id} not found")  unless Feature.exists?(id: feature_id)

  end

end

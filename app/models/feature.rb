class Feature < ApplicationRecord
    attribute :type, :string
    attribute :external_id, :string
    attribute :magnitude, :decimal
    attribute :longitude, :decimal
    attribute :latitude, :decimal
    attribute :title, :string
    attribute :tsunami, :boolean
    attribute :time, :string
    attribute :place, :string
    attribute :external_url, :string 

    # Enumerado para magType
    enum mag_type: { md: 0, ml: 1, ms: 2, mw: 3, me: 4, mi: 5, mb: 6, mlg: 7 }

    validates :title, presence: true
    validates :place, presence: true
    validates :mag_type, presence: true
    validates :magnitude, presence: true
    validates :longitude, presence: true
    validates :latitude, presence: true
    validates :external_url, presence: true

    has_many :comments, dependent: :destroy

end

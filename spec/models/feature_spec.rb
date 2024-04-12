require 'rails_helper'

RSpec.describe Feature, type: :model do

  #Validation test for the mag_type attribute only take the declared values
  it { should define_enum_for(:mag_type).with_values(md: 0, ml: 1, ms: 2, mw: 3, me: 4, mi: 5, mb: 6, mlg: 7, mwr: 8, mb_lg: 9, mww: 10) }

  # Validation test attributes that are mandatory
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:place) }
  it { should validate_presence_of(:mag_type) }
  it { should validate_presence_of(:magnitude) }
  it { should validate_presence_of(:longitude) }
  it { should validate_presence_of(:latitude) }
  it { should validate_presence_of(:external_url) }

  #Validation test of the relationship between features and comments
  it { should have_many(:comments).dependent(:destroy) }

  #Test validation test deletion of comments when a feature is destroyed
  it 'destroys associated comments' do
    feature = FactoryBot.create(:feature)
    create_list(:comment, 3, feature: feature)
    expect { feature.destroy }.to change(Comment, :count).by(-3)
  end

end

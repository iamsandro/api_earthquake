require 'rails_helper'

RSpec.describe Comment, type: :model do

  # Validation test attributes that are mandatory
  it 'does not create a comment without feature_id' do
    comment = FactoryBot.build(:comment, feature_id: nil)
    expect(comment).not_to be_valid
  end
  
  it { should validate_presence_of(:body) }

  #Validation test of the relationship between features and comments
  it { should belong_to(:feature) }

  #Test validation test deletion of comments when a feature is destroyed
  it 'destroys associated comments' do
    feature = FactoryBot.create(:feature)
    create_list(:comment, 3, feature: feature)
    expect { feature.destroy }.to change(Comment, :count).by(-3)
  end

end

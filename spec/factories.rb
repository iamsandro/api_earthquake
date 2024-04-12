FactoryBot.define do

    factory :feature do
        title { "M 0.6 - 7 km WNW of Cobb, CA" }
        place { "7 km WNW of Cobb, CA" }
        longitude { -122.8021698  }
        latitude { 38.8380013 }
        magnitude { 0.64 }
        mag_type { "md" }
        external_id { "nc74030246" }
        external_url { "https://earthquake.usgs.gov/earthquakes/eventpage/nc74030246" }
        type { "Feature" }
      end

    factory :comment do
        body { "My first comment" }
        association :feature
    end
    
  
  end
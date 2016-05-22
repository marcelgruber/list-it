FactoryGirl.define do
  factory :comment do
    commenter "MyString"
    body "MyText"
    listing nil
  end
end

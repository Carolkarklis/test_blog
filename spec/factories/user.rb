FactoryBot.define do
  factory :user do
    email  { "testing123@gmail.com" }
    password { "123456" }
    api_token { "f9bfafe5-a812-417d-9d33-686cd88cf6c0" }
  end
end

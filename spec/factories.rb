FactoryBot.define do
  factory :admin do
    email { "#{rand(999)}@email.com" }
    password { "password"} 
  end
end
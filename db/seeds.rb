User.create!(email: "admin@example.com", password: "adminexample", password_confirmation: "adminexample")

30.times do
    Course.create!([{
        title: Faker::Educator.course_name,
        description: Faker::Quotes::Shakespeare.hamlet_quote,
        user_id: User.first.id
    }])
end
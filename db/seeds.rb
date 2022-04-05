# User.create!(email: "admin@example.com", password: "adminexample", password_confirmation: "adminexample")

30.times do
    Course.create!([{
        title: Faker::Educator.course_name,
        description: Faker::Quotes::Shakespeare.hamlet_quote,
        user_id: User.first.id,
        short_description: Faker::Quote.jack_handey,
        language: Faker::ProgrammingLanguage.name,
        level: "Beginner",
        price: Faker::Number.between(from: 1000, to: 2000)
    }])
end
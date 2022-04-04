30.times do
    Course.create!([{
        title: Faker::Educator.course_name,
        description: Faker::Quotes::Shakespeare.hamlet_quote
    }])
end
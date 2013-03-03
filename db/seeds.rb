def new_blog_attributes
  { title: Faker::Lorem.words(8).join(" "),
    excerpt: Faker::Lorem.paragraph,
    url: Faker::Internet.url }
end

Repository.all.each do |r|
  10.times do
    r.blogs.create(new_blog_attributes)
  end
end

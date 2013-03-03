def title_excerpt_url
  { title: Faker::Lorem.words(8).join(" "),
    excerpt: Faker::Lorem.paragraph,
    url: Faker::Internet.url }
end

def subs_service_attributes
  { title: Faker::Lorem.words(8).join(" "),
    description: Faker::Lorem.paragraph,
    url: Faker::Internet.url }
end

Repository.all.each do |r|
  r.subscription_services.create(subs_service_attributes)
  r.blogs.create(title_excerpt_url)
  r.tips.create(title_excerpt_url)
  r.slides.create(title_excerpt_url)
  r.qnas.create(title_excerpt_url)
  r.screencasts.create(title_excerpt_url)
  r.noteworthies.create(title_excerpt_url)
end

json.(dog, :id, :name, :age, :size, :description, :user_id, :avg_rating)

json.dog_photo_small(dog.photo.img_url)

json.dog_photo_large(dog.photo.img_url)

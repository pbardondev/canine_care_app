namespace :db do
  task :copy_to_photo_model do
    Sitter.all.each do |sitter|
      photo = sitter.sitter_photo
      sitter.create_photo({ img: photo })
      unless sitter.save!
        puts "Failed to save #{sitter.user_name}"
      end
      sitter.sitter_photo.destroy
    end
  end
end

module ApplicationHelper

  def randomized_background_image
    images = ["assets/IMG_8794.JPG", "assets/IMG_8780.JPG", "assets/IMG_0055.jpg", "assets/IMG_8777-2.jpg" ]
    images[rand(images.size)]
  end

end

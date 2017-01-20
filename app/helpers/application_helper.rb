module ApplicationHelper

  def randomized_background_image
    images = ["assets/IMG_8794-2.jpg", "assets/IMG_8780-2.jpg", "assets/IMG_0055.jpg", "assets/IMG_8777-2.jpg", "assets/IMG_6861-2.jpg", "assets/IMG_6864-2.jpg","assets/DSC02279.jpg", "assets/IMG_6037-2.jpg", "assets/IMG_6474-3-2.jpg", "assets/DSC05641-2.jpg", "assets/_MG_2393-2.jpg", "assets/IMG_6736-2-2.jpg" ]
    images[rand(images.size)]
  end

end

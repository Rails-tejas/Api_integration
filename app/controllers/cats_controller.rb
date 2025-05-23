class CatsController < ApplicationController
  def index
    # Render the search page initially
  end

  def search
    cat_breed = params[:breed] # Getting the breed from the form
    response = HTTParty.get("https://api.thecatapi.com/v1/breeds/search?q=#{cat_breed}", 
                           headers: { "x-api-key" => "live_n91TcxLHiOtnsOw1bMZ8NekuVg5WdJYzxXiO1K0kZxvEs5HePTmM450TIO2DWnjV" })
    
    if response.code == 200 && response.parsed_response.any?
      @cat_info = response.parsed_response.first
      @image_url = fetch_cat_image(@cat_info["id"]) # Call method to fetch image
    else
      @error = "No information found for the given breed."
    end
  end

  private

  def fetch_cat_image(cat_id)
    image_response = HTTParty.get("https://api.thecatapi.com/v1/images/search?breed_ids=#{cat_id}",
                                  headers: { "x-api-key" => "YOUR_API_KEY" })
    if image_response.code == 200 && image_response.parsed_response.any?
      image_response.parsed_response.first["url"]
    else
      nil
    end
  end
end

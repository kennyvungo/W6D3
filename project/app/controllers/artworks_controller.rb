class ArtworksController < ApplicationController
    def index
        @artworks = Artwork.all
        render json: @artworks
    end


    def show
        @artwork = Artwork.find(params[:id])
        render json: @artwork
    end

    def create
        @artwork = Artwork.create(artworks_params)
        if @artwork
            render json: @artwork
        else
            render json: @artwork.errors.full_messages, status: 422
        end
    end

    def update
        @artwork = Artwork.find(params[:id])
        if @artwork
            @artwork.update(artworks_params)
            render json: @artwork
        else
            render json: @artwork.errors.full_messages, status: 422
        end
    end

    def destroy
        @artwork = Artwork.find(params[:id])
        if @artwork
            @artwork.destroy
            redirect_to artworks_url
        else
            render json: @artwork.errors.full_messages, status: 422
        end
    end

    def artworks_params
        params.require(:artwork).permit(:title, :image_url, :artist_id)
    end
end

class ArtworkSharesController < ApplicationController
    def create
        @share = ArtworkShare.create(share_params)
        if @share
            render json: @share
        else
            render json: @share.errors.full_messages, status: 422
        end
    end

    def destroy
        @share = ArtworkShare.find(params[:id])
        if @share
            @share.destroy
            render json: ArtworkShare.all
        else
            render json: @share.errors.full_messages, status: 422
        end
    end

    def share_params
        params.require(:artwork_share).permit(:artwork_id, :viewer_id)
    end
end

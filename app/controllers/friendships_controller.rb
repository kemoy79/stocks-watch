class FriendshipsController < ApplicationController

  def create
   fship = current_user.friendships.build(friend_id: params[:friend])
   if fship.save 
    flash[:notice] = "You are following #{User.find(fship.user_id).email}"
    redirect_to friends_path
   else
    flash[:alert] = "Something not right!!"
    redirect_to friends_path
    
   end
  end


  def destroy
    friendship = current_user.friendships.where(friend_id: params[:id]).first
    friendship.destroy
    flash[:notice] = "Unfollowed succesful"
    redirect_to friends_path
  end

end
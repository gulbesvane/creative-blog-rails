class ContactsController < ApplicationController
  require 'mail_form'
    def index
        
      end
          @contact = Contact.new
      def new

      end
    
      def create
        @contact = Contact.new(params[:contact])
        @contact.request = request
        if @contact.deliver
          flash.now[:success] = 'Message sent, thank you!'
        else
          flash.now[:error] = 'Could not send message'
          render :index
        end
      end
end

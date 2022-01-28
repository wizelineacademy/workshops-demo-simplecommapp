# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  after_create_commit :send_welcome_email
  
  def full_name
    [first_name, last_name].join(" ")
  end

  private 

  def send_welcome_email
    AccountMailer.welcome(self).deliver_later
  end
end

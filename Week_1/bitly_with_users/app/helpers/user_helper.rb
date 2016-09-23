helpers do
  # Esto deberá de regresar al usuario con una sesión actual si es que existe 
  def current_user
     @current_user ||= User.find(session[:id])
  end

  # Regresa true si el current_user existe y false de otra manera 
  def logged_in?
  end
end
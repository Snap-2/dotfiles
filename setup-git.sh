while true; do
  read -p "Set up github multi-account credentials? (y/n): " yn
  case $yn in
    [Yy] )
      echo "Continuing..."

      # PERSONAL ACCOUNT SETUP
      git config --global credential.personal.namespace personal

      read -p "Personal account name: " p_name
      git config --global credential.personal.name $p_name
      read -p "Personal account email: " p_email
      git config --global credential.personal.email $p_email


      git config --global credential.personal.helper manager

      # WORK ACCOUNT SETUP
      git config --global credential.work.namespace work


      read -p "Work account name: " w_name
      git config --global credential.work.name $w_name
      read -p "Work account email: " w_email
      git config --global credential.work.email $w_email


      git config --global credential.work.helper manager

      break
      ;;
    [Nn] )
      echo "Exiting..."
      # Code to execute if no or exit
      exit
      ;;
    * )
      echo "Invalid input. Please enter y or n."
      ;;
  esac
done

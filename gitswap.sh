while true; do
  read -p "Select an account: (1 = Personal || 2 = Work): " account
  case $account in
    [1] )
      echo "Selecting personal account..."
      name=$(git config --global credential.personal.name)
      git config --global user.name $name
      email=$(git config --global credential.personal.email)
      git config --global user.email $email

      # MUST BE USING CREDENTIAL MANAGER STORE (PLAIN TEXT STORAGE EWWW I KNOW)
      if $(grep $name ~/.git-credentials) == ""
          echo "Sending creds to alternate file..."
          echo "$(cat ~/.git-credentials)" > ~/.git-creds-$name # makes a new file for it

      break
      ;;
    [2] )
      echo "Selecting work account..."
      name=$(git config --global credential.work.name)
      git config --global user.name $name
      email=$(git config --global credential.work.email)
      git config --global user.email $email 

      # MUST BE USING CREDENTIAL MANAGER STORE (PLAIN TEXT STORAGE EWWW I KNOW)
      if $(grep $name ~/.git-credentials) == ""
          echo "Sending creds to alternate file..."
          echo "$(cat ~/.git-credentials)" > ~/.git-creds-$name # makes a new file for it

      exit
      ;;
    * )
      echo "Invalid input. Please enter 1 or 2."
      ;;
  esac
done

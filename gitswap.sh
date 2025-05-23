while true; do
  read -p "Select an account: (1 = Personal || 2 = Work): " account
  case $account in
    [1] ) # PERSONAL
      echo "Selecting personal account..."
      name=$(git config --global credential.personal.name)
      git config --global user.name $name
      email=$(git config --global credential.personal.email)
      git config --global user.email $email

      # MUST BE USING CREDENTIAL MANAGER STORE (PLAIN TEXT STORAGE EWWW I KNOW)
      if [ -f ~/.git-credentials ]
      then
          personal_creds=~/.git-creds-$(git config --global credential.personal.name)
          work_creds=~/.git-creds-$(git config --global credential.work.name)

          if [ $(grep -c $name ~/.git-credentials) == 0 ]
          then
              echo "Sending creds to alternate file..."
              touch $work_creds
              echo "$(cat ~/.git-credentials)" > $work_creds # makes a new file for it

              if [ -f "$personal_creds" ] # if cred file exists
              then
                  echo "$(cat $personal_creds)" > ~/.git-credentials
              else
                  rm -rf ~/.git-credentials
              fi
          else
              echo "Already using this profile."
          fi
      else
          echo ".git-credentials not present!"
      fi

      break
      ;;
    [2] ) # WORK
      echo "Selecting work account..."
      name=$(git config --global credential.work.name)
      git config --global user.name $name
      email=$(git config --global credential.work.email)
      git config --global user.email $email 

      # MUST BE USING CREDENTIAL MANAGER STORE (PLAIN TEXT STORAGE EWWW I KNOW)
      if [ -f ~/.git-credentials ]
      then
          personal_creds=~/.git-creds-$(git config --global credential.personal.name)
          work_creds=~/.git-creds-$(git config --global credential.work.name)

          if [ $(grep -c $name ~/.git-credentials) == 0 ]
          then
              echo "Sending creds to alternate file..."
              touch $personal_creds
              echo "$(cat ~/.git-credentials)" > $personal_creds # makes a new file for it

              if [ -f "$work_creds" ] # if cred file exists
              then
                  echo "$(cat $work_creds)" > ~/.git-credentials
              else
                  rm -rf ~/.git-credentials
              fi
          else
              echo "Already using this profile."
          fi
      else
          echo ".git-credentials not present!"
      fi

      exit
      ;;
    * )
      echo "Invalid input. Please enter 1 or 2."
      ;;
  esac
done

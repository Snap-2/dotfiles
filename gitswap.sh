while true; do
  read -p "Select an account: (1 = Personal || 2 = Work): " account
  case $account in
    [1] )
      echo "Selecting personal account..."
      git config --global user.name credential.personal.name
      git config --global user.email credential.personal.email
      break
      ;;
    [2] )
      echo "Selecting work account..."
      git config --global user.name credential.work.name
      git config --global user.email credential.work.email
      exit
      ;;
    * )
      echo "Invalid input. Please enter 1 or 2."
      ;;
  esac
done

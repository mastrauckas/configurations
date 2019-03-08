function isKubectlInstalled {
   if which kubectl > /dev/null; then
     if [[ -n $(kubectl config current-context 2> /dev/null) ]]; then
         echo "1"
      else
         echo "0"
      fi
   else
      echo "0"
   fi
}

function getNamespace() {
   echo $(kubectl config get-contexts  $(kubectl config current-context) --no-headers | sed 's/.* //')
}

function getCurrentContext() {
   echo $(kubectl config current-context)
}

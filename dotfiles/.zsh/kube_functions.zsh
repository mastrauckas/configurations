function isKubectlInstalled {
   if [[ -n $(which kubectl 2> /dev/null) ]]; then
      echo "0"
   else
      echo "1"
   fi
}

function getNamespace() {
   echo $(kubectl config get-contexts  $(kubectl config current-context) --no-headers | sed 's/.* //')
}

function getCurrentContext() {
   echo $(kubectl config current-context)
}

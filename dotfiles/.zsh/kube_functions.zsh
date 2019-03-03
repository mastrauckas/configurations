function isKubectlInstalled {
   if type "kubectl" > /dev/null; then
      echo "1"
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
